import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uap_app/core/failure/failure.dart';
import 'package:uap_app/core/utils/params.dart';

abstract class SignInUsecases {
  Future<Either<Failure, UserCredential>> call(SignInParams params);
}
