import 'package:dartz/dartz.dart';
import 'package:uap_app/core/failure/failure.dart';

abstract class DeletePersonMapUsecase {
  Future<Either<Failure, String>> deletePersonMap(String id);
}
