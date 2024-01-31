import 'package:uap_app/core/services/auth_service.dart';
import 'package:uap_app/core/services/database_service.dart';
import 'package:uap_app/features/register/repository/register_repository.dart';

class RegisterRepositoryImpl implements RegisterRepository{
  final AuthService authService;
  final DatabaseService databaseService;

  RegisterRepositoryImpl(this.authService, this.databaseService);
  @override
  Future register(String pass, String password) async{

    
  final futureUser = await authService.instance.createUserWithEmailAndPassword(
    email: pass, password: password);

  if (futureUser.user != null) {
    final usersCollection = databaseService.instance.collection('users');
    usersCollection.doc(authService.instance.currentUser!.uid).set({'email': pass});
  } else {
    print('usuario já existe');
  }
}

}