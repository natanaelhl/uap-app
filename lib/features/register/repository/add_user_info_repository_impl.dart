import 'package:uap_app/core/services/auth_service.dart';
import 'package:uap_app/core/services/database_service.dart';
import 'package:uap_app/features/register/params/sign_up_params.dart';
import 'package:uap_app/features/register/repository/add_user_info_repository.dart';

class AddUserInfoRepositoryImpl implements AddUserInfoRepository {
  final AuthService authService;
  final DatabaseService dbService;

  const AddUserInfoRepositoryImpl(this.authService, this.dbService);

  @override
  Future<void> addUserInfo(SignUpParams params) async {
    final usersCollection = dbService.instance.collection('users');
    usersCollection.doc(authService.instance.currentUser!.uid).set({
      'email': params.email,
      'first_name': params.firstName,
      'last_name': params.lastName,
      'phone': params.phone,
    });
  }
}
