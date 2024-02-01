import 'package:flutter/widgets.dart';

class SplashCallbacks {
  final BuildContext context;

  SplashCallbacks({required this.context});

  //CallBack para alterar a tela do usuário após a splash
  void navigatorPage(String route) {
    Navigator.pushNamedAndRemoveUntil(context, route, (route) => false);
  }
}
