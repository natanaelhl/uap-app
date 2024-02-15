import 'package:dartz/dartz.dart';
import 'package:uap_app/core/failure/failure.dart';
import 'package:uap_app/core/services/auth_service.dart';
import 'package:uap_app/core/services/database_service.dart';
import 'package:uap_app/features/create_map/repositories/delete_person_map_repository.dart';

class DeletePersonMapRepositoryImpl implements DeletePersonMapRepository {
  final AuthService authService;
  final DatabaseService dbservice;

  const DeletePersonMapRepositoryImpl(this.authService, this.dbservice);
  @override
  Future<Either<Failure, String>> deletePersonMap(String id) async {
    try {
      await dbservice.instance
          .collection('users')
          .doc(authService.instance.currentUser!.uid)
          .collection('people')
          .doc(id)
          .delete();
      return Right(id);
    } on Exception catch (e) {
      return Left(RemoteFailure(message: e.toString()));
    }
  }
}
