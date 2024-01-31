import 'package:flutter/material.dart';

class RegisterCallbacks {
  final BuildContext context;

  RegisterCallbacks({required this.context});

  //Callback para quando o registro é bem sucedido
  void onRegisterSuccessAction(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
        context, '/personMapView', (route) => false);
  }

  //Callback para quando o registro falhar
  void onRegisterErrorAction() {
    print('registro falhou');
  }

  //Callback para retornar para a tela de login
  void onNavigateFeatureAction() {
    Navigator.pop(context);
  }
}
