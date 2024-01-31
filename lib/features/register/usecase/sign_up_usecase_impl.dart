import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uap_app/core/failure/failure.dart';
import 'package:uap_app/features/register/params/sign_up_params.dart';
import 'package:uap_app/features/register/repository/register_repository.dart';
import 'package:uap_app/features/register/usecase/sign_up_usecase.dart';

class SignUpUsecaseImpl implements SignUpUsecase {
  final RegisterRepository repository;

  const SignUpUsecaseImpl(this.repository);

  @override
  Future<Either<Failure, UserCredential>> call(SignUpParams params) async {
    return await repository.register(params);
  }
}
