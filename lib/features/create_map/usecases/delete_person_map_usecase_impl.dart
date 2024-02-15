import 'package:dartz/dartz.dart';
import 'package:uap_app/core/failure/failure.dart';
import 'package:uap_app/features/create_map/repositories/delete_person_map_repository.dart';
import 'package:uap_app/features/create_map/usecases/delete_person_map_usecase.dart';

class DeletePersonMapUsecaseImpl implements DeletePersonMapUsecase {
  final DeletePersonMapRepository repository;

  const DeletePersonMapUsecaseImpl(this.repository);

  @override
  Future<Either<Failure, String>> deletePersonMap(String id) async {
    return await repository.deletePersonMap(id);
  }
}
