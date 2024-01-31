import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uap_app/core/failure/failure.dart';
import 'package:uap_app/features/register/params/sign_up_params.dart';

abstract class SignUpUsecase {
  Future<Either<Failure, UserCredential>> call(SignUpParams params);
}
