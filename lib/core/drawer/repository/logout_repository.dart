import 'package:dartz/dartz.dart';
import 'package:uap_app/core/failure/failure.dart';

abstract class SignOutRepository {
  Future<Either<Failure, void>> signOut();
}
