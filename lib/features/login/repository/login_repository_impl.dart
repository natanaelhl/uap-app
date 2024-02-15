import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uap_app/core/failure/failure.dart';
import 'package:uap_app/core/services/auth_service.dart';
import 'package:uap_app/core/utils/params.dart';
import 'package:uap_app/core/utils/string_translator.dart';
import 'package:uap_app/features/login/repository/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final AuthService service;

  const LoginRepositoryImpl(this.service);

  @override
  Future<Either<Failure, UserCredential>> signIn(SignInParams params) async {
    try {
      return Right(await service.instance.signInWithEmailAndPassword(
          email: params.email, password: params.password));
    } on Exception catch (e) {
      return Left(RemoteFailure(message: StringTranslator.get(e.toString())));
    }
  }
}
