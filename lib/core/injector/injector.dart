import 'package:get_it/get_it.dart';
import 'package:uap_app/core/services/auth_service.dart';
import 'package:uap_app/core/services/database_service.dart';
import 'package:uap_app/features/create_map/bloc/create_map_bloc.dart';
import 'package:uap_app/features/create_map/repositories/create_person_map_repository.dart';
import 'package:uap_app/features/create_map/repositories/create_person_map_repository_impl.dart';
import 'package:uap_app/features/create_map/repositories/delete_person_map_repository.dart';
import 'package:uap_app/features/create_map/repositories/delete_person_map_repository_impl.dart';
import 'package:uap_app/features/create_map/repositories/edit_person_map_repository.dart';
import 'package:uap_app/features/create_map/repositories/edit_person_map_repository_impl.dart';
import 'package:uap_app/features/create_map/repositories/get_person_list_repository.dart';
import 'package:uap_app/features/create_map/repositories/get_person_list_repository_impl.dart';
import 'package:uap_app/features/create_map/usecases/create_person_map_usecase.dart';
import 'package:uap_app/features/create_map/usecases/create_person_map_usecase_impl.dart';
import 'package:uap_app/features/create_map/usecases/delete_person_map_usecase.dart';
import 'package:uap_app/features/create_map/usecases/delete_person_map_usecase_impl.dart';
import 'package:uap_app/features/create_map/usecases/edit_person_map_usecase.dart';
import 'package:uap_app/features/create_map/usecases/edit_person_map_usecase_impl.dart';
import 'package:uap_app/features/create_map/usecases/get_person_list_usecase.dart';
import 'package:uap_app/features/create_map/usecases/get_person_list_usecase_impl.dart';
import 'package:uap_app/features/login/bloc/login_bloc.dart';
import 'package:uap_app/features/login/repository/login_repository.dart';
import 'package:uap_app/features/login/repository/login_repository_impl.dart';
import 'package:uap_app/features/login/usecases/sign_in_usecases.dart';
import 'package:uap_app/features/login/usecases/sign_in_usecases_impl.dart';
import 'package:uap_app/features/person_map/presentation/bloc/person_map_bloc.dart';
import 'package:uap_app/features/person_map/triangle/person_map_triangle.dart';
import 'package:uap_app/features/person_map/triangle/person_map_triangle_impl.dart';
import 'package:uap_app/features/register/bloc/register_bloc.dart';
import 'package:uap_app/features/register/repository/add_user_info_repository.dart';
import 'package:uap_app/features/register/repository/add_user_info_repository_impl.dart';
import 'package:uap_app/features/register/repository/register_repository.dart';
import 'package:uap_app/features/register/repository/register_repository_impl.dart';
import 'package:uap_app/features/register/usecase/add_user_info_usecase.dart';
import 'package:uap_app/features/register/usecase/add_user_info_usecase_impl.dart';
import 'package:uap_app/features/register/usecase/sign_up_usecase.dart';
import 'package:uap_app/features/register/usecase/sign_up_usecase_impl.dart';

class Injector {
  static build() {
    GetIt getIt = GetIt.instance;

    // CORE
    getIt.registerLazySingleton(() => AuthService());
    getIt.registerLazySingleton(() => DatabaseService());

    //TRIANGLE
    getIt.registerLazySingleton<PersonMapTriangle>(
        () => PersonMapTriangleImpl(getIt()));

    //REPOSITORIES
    getIt.registerLazySingleton<RegisterRepository>(
        () => RegisterRepositoryImpl(getIt()));
    getIt.registerLazySingleton<AddUserInfoRepository>(
        () => AddUserInfoRepositoryImpl(getIt(), getIt()));
    getIt.registerLazySingleton<LoginRepository>(
        () => LoginRepositoryImpl(getIt()));
    // create_map
    getIt.registerLazySingleton<CreatePersonMapRepository>(
        () => CreatePersonMapRepositoryImpl(getIt(), getIt()));
    getIt.registerLazySingleton<GetPersonListRepository>(
        () => GetPersonListRepositoryImpl(getIt(), getIt()));
    getIt.registerLazySingleton<DeletePersonMapRepository>(
        () => DeletePersonMapRepositoryImpl(getIt(), getIt()));
    getIt.registerLazySingleton<EditPersonMapRepository>(
        () => EditPersonMapRepositoryImpl(getIt(), getIt()));

    //USECASES
    getIt
        .registerLazySingleton<SignUpUsecase>(() => SignUpUsecaseImpl(getIt()));
    getIt.registerLazySingleton<AddUserInfoUsecase>(
        () => AddUserInfoUsecaseImpl(getIt()));
    getIt.registerLazySingleton<SignInUsecases>(
        () => SignInUsecasesImpl(getIt()));
    // create_map
    getIt.registerLazySingleton<CreatePersonMapUsecase>(
        () => CreatePersonMapUsecaseImpl(getIt()));
    getIt.registerLazySingleton<GetPersonListUsecase>(
        () => GetPersonListUsecaseImpl(getIt()));
    getIt.registerLazySingleton<DeletePersonMapUsecase>(
        () => DeletePersonMapUsecaseImpl(getIt()));
    getIt.registerLazySingleton<EditPersonMapUsecase>(
        () => EditPersonMapUsecaseImpl(getIt()));

    //BLOC
    getIt.registerFactory(() => RegisterBloc(getIt(), getIt()));
    getIt.registerFactory(() => LoginBloc(getIt()));
    // create_map
    getIt.registerFactory(
        () => CreateMapBloc(getIt(), getIt(), getIt(), getIt()));
    // person_map
    getIt.registerFactory(() => PersonMapBloc(getIt()));
  }
}
