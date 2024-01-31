import 'package:flutter/material.dart';
import 'package:uap_app/features/register/view/register_view.dart';

class LoginCallbacks {

  final BuildContext context;
  const LoginCallbacks(this.context);

  // Callback para quando o login é bem-sucedido
  void onLoginSuccessAction(BuildContext context) {
  Navigator.pushNamedAndRemoveUntil(context, '/personMapView', (route) => false);
}

  //Callback para quando o login falha
  void onLoginErrorAction(BuildContext context){
  print('erro ao fazer login');
}

  //Callback para navegar entre telas
  void onLoginPushNamedAction(BuildContext context, String route){
    Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterView()));
  }
}