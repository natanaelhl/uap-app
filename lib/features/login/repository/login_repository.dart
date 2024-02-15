import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uap_app/core/failure/failure.dart';
import 'package:uap_app/core/utils/params.dart';

abstract class LoginRepository {
  Future<Either<Failure, UserCredential>> signIn(SignInParams params);
}
