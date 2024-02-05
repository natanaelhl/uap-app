import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:uap_app/core/failure/failure.dart';
import 'package:uap_app/core/services/auth_service.dart';
import 'package:uap_app/core/services/database_service.dart';
import 'package:uap_app/features/create_map/models/person_model.dart';
import 'package:uap_app/features/create_map/repositories/get_person_list_repository.dart';

class GetPersonListRepositoryImpl implements GetPersonListRepository {
  final AuthService authService;
  final DatabaseService dbService;

  const GetPersonListRepositoryImpl(this.authService, this.dbService);

  @override
  Future<Either<Failure, List<PersonModel>>> getListPerson() async {
    
    try {
      var result = await dbService.instance
          .collection('users')
          .doc(authService.instance.currentUser!.uid)
          .collection('people')
          .get();
      

      List<PersonModel> personList =
          result.docs.map((e) => PersonModel.fromJson(e)).toList();
      
      return Right(personList);
    } on Exception catch (e) {
      return Left(RemoteFailure(message: e.toString()));
    }
  }
}
