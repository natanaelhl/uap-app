import 'package:dartz/dartz.dart';
import 'package:uap_app/core/failure/failure.dart';
import 'package:uap_app/core/drawer/repository/logout_repository.dart';
import 'package:uap_app/core/services/auth_service.dart';

class SignOutRepositoryImpl implements SignOutRepository {
  final AuthService service;

  const SignOutRepositoryImpl(this.service);
  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      return Right(await service.instance.signOut());
    } on Exception catch (e) {
      return Left(RemoteFailure(message: e.toString()));
    }
  }
}
