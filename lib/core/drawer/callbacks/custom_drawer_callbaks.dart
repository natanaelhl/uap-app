import 'package:flutter/material.dart';

class CustomDrawerCallback {
  final BuildContext context;

  const CustomDrawerCallback({required this.context});
  //Callback se a função signOut for válida
  void navigatorToPage() {
    Navigator.pushNamedAndRemoveUntil(context, '/loginView', (route) => false);
  }

  //Callback se a função signOut for inválida
  void showDialog() {
    print('Erro ao deslogar');
  }
}
