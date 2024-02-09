import 'package:get_it/get_it.dart';
import 'package:uap_app/core/services/auth_service.dart';
import 'package:uap_app/core/services/database_service.dart';
import 'package:uap_app/features/register/bloc/register_bloc.dart';
import 'package:uap_app/features/register/repository/add_user_info_repository.dart';
import 'package:uap_app/features/register/repository/add_user_info_repository_impl.dart';
import 'package:uap_app/features/register/repository/register_repository.dart';
import 'package:uap_app/features/register/repository/register_repository_impl.dart';
import 'package:uap_app/features/register/usecase/sign_up_usecase.dart';
import 'package:uap_app/features/register/usecase/sign_up_usecase_impl.dart';
import 'package:uap_app/features/register/view/components/add_user_info_usecase.dart';
import 'package:uap_app/features/register/view/components/add_user_info_usecase_impl.dart';

class Injector {
  static build() {
    GetIt getIt = GetIt.instance;

    // CORE
    getIt.registerLazySingleton(() => AuthService());
    getIt.registerLazySingleton(() => DatabaseService());

    //REPOSITORIES
    getIt.registerLazySingleton<RegisterRepository>(
        () => RegisterRepositoryImpl(getIt()));
    getIt.registerLazySingleton<AddUserInfoRepository>(
        () => AddUserInfoRepositoryImpl(getIt(), getIt()));

    //USECASES
    getIt
        .registerLazySingleton<SignUpUsecase>(() => SignUpUsecaseImpl(getIt()));
    getIt.registerLazySingleton<AddUserInfoUsecase>(
        () => AddUserInfoUsecaseImpl(getIt()));

    //BLOC
    getIt.registerFactory(() => RegisterBloc(getIt(), getIt()));
  }
}
