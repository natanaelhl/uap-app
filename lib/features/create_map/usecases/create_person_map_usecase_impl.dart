import 'package:dartz/dartz.dart';
import 'package:uap_app/core/failure/failure.dart';
import 'package:uap_app/core/utils/params.dart';
import 'package:uap_app/features/create_map/models/person_model.dart';
import 'package:uap_app/features/create_map/repositories/create_person_map_repository.dart';
import 'package:uap_app/features/create_map/usecases/create_person_map_usecase.dart';

class CreatePersonMapUsecaseImpl implements CreatePersonMapUsecase {
  final CreatePersonMapRepository repository;

  CreatePersonMapUsecaseImpl(this.repository);
  @override
  Future<Either<Failure, PersonModel>> createPersonMap(
      PersonParams params) async {
    return await repository.createPersonMap(params);
  }
}
