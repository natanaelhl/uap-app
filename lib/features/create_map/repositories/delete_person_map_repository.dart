import 'package:dartz/dartz.dart';
import 'package:uap_app/core/failure/failure.dart';

abstract class DeletePersonMapRepository {
  Future<Either<Failure, String>> deletePersonMap(String id);
}
