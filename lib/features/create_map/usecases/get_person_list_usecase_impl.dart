import 'package:dartz/dartz.dart';
import 'package:uap_app/core/failure/failure.dart';
import 'package:uap_app/features/create_map/models/person_model.dart';
import 'package:uap_app/features/create_map/repositories/get_person_list_repository.dart';
import 'package:uap_app/features/create_map/usecases/get_person_list_usecase.dart';

class GetPersonListUsecaseImpl implements GetPersonListUsecase {
  final GetPersonListRepository repository;

  const GetPersonListUsecaseImpl(this.repository);
  @override
  Future<Either<Failure, List<PersonModel>>> getListPerson() async {
    return await repository.getListPerson();
  }
}
