import 'package:dartz/dartz.dart';
import 'package:uap_app/core/failure/failure.dart';
import 'package:uap_app/core/services/auth_service.dart';
import 'package:uap_app/core/services/database_service.dart';
import 'package:uap_app/features/create_map/models/person_model.dart';
import 'package:uap_app/features/create_map/params/person_params.dart';
import 'package:uap_app/features/create_map/repositories/create_person_map_repository.dart';

class CreatePersonMapRepositoryImpl implements CreatePersonMapRepository {
  final AuthService authService;
  final DatabaseService dbService;
  const CreatePersonMapRepositoryImpl(this.authService, this.dbService);
  @override
  Future<Either<Failure, PersonModel>> createPersonMap(
      PersonParams params) async {
    try {
      final doc = dbService.instance
          .collection('users')
          .doc(authService.instance.currentUser!.uid)
          .collection('people')
          .doc();

      final PersonModel person =
          PersonModel(name: params.name, data: params.data, id: doc.id);

      doc.set(toMap(person));
      return Right(person);
    } on Exception catch (e) {
      return Left(RemoteFailure(message: e.toString()));
    }
  }
}
