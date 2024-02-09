import 'package:flutter/material.dart';
import 'package:uap_app/features/login/controller/login_controller.dart';
import 'package:uap_app/features/login/view/build_login_form.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final LoginController _controller;

  late final TextEditingController emailController;
  late final TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: buildLoginForm(
      context,
      _controller,
      emailController,
      passwordController,
    ));
  }
}
