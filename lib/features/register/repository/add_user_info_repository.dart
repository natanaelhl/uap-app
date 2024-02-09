import 'package:uap_app/features/register/params/sign_up_params.dart';

abstract class AddUserInfoRepository {
  Future<void> addUserInfo(SignUpParams params);
}
