import 'package:uap_app/core/services/auth_service.dart';
import 'package:uap_app/features/login/repository/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository{

  final AuthService service;

  const LoginRepositoryImpl(this.service);


  @override
  Future signIn(String email, String password) async{
    return await service.instance.signInWithEmailAndPassword(email: email, password: password);
  }
}
