import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uap_app/core/failure/failure.dart';
import 'package:uap_app/core/services/auth_service.dart';
import 'package:uap_app/features/register/params/sign_up_params.dart';
import 'package:uap_app/features/register/repository/register_repository.dart';

class RegisterRepositoryImpl implements RegisterRepository {
  final AuthService authService;

  RegisterRepositoryImpl(
    this.authService,
  );
  @override
  Future<Either<Failure, UserCredential>> register(SignUpParams params) async {
    try {
      return Right(await authService.instance.createUserWithEmailAndPassword(
          email: params.email, password: params.password));
    } on Exception catch (e) {
      return Left(RemoteFailure(message: e.toString()));
    }
  }
}
