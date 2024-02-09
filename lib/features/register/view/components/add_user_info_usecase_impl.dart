import 'package:uap_app/features/register/params/sign_up_params.dart';
import 'package:uap_app/features/register/repository/add_user_info_repository.dart';
import 'package:uap_app/features/register/view/components/add_user_info_usecase.dart';

class AddUserInfoUsecaseImpl implements AddUserInfoUsecase {
  final AddUserInfoRepository repository;
  const AddUserInfoUsecaseImpl(this.repository);

  @override
  Future<void> call(SignUpParams params) async {
    return await repository.addUserInfo(params);
  }
}
