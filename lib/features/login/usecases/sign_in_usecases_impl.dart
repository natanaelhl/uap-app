import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uap_app/core/failure/failure.dart';
import 'package:uap_app/core/utils/params.dart';
import 'package:uap_app/features/login/repository/login_repository.dart';
import 'package:uap_app/features/login/usecases/sign_in_usecases.dart';

class SignInUsecasesImpl implements SignInUsecases {
  final LoginRepository repository;

  const SignInUsecasesImpl(this.repository);

  @override
  Future<Either<Failure, UserCredential>> call(SignInParams params) async {
    return await repository.signIn(params);
  }
}
