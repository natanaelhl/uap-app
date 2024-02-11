import 'package:uap_app/features/register/params/sign_up_params.dart';

abstract class AddUserInfoUsecase {
  Future<void> call(SignUpParams params);
}
