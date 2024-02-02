import 'package:dartz/dartz.dart';
import 'package:uap_app/core/drawer/usecases/logout_usecase.dart';
import 'package:uap_app/core/failure/failure.dart';
import 'package:uap_app/core/drawer/repository/logout_repository.dart';

class SignOutUsecaseImpl implements SignOutUsecase {
  final SignOutRepository repository;

  const SignOutUsecaseImpl(this.repository);

  @override
  Future<Either<Failure, void>> signOut() async {
    return await repository.signOut();
  }
}
