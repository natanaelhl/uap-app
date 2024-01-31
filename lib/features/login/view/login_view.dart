import 'package:flutter/material.dart';
import 'package:uap_app/core/services/auth_service.dart';
import 'package:uap_app/features/login/controller/login_controller.dart';
import 'package:uap_app/features/login/repository/login_repository_impl.dart';
import 'package:uap_app/features/login/usecases/sign_in_usecases_impl.dart';
import 'package:uap_app/features/login/view/build_login_form.dart';
import 'package:uap_app/features/login/callbacks/login_callbacks.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final LoginController _controller;
  late final LoginCallbacks _callbacks;

  late final TextEditingController emailController;
  late final TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();

    _callbacks = LoginCallbacks(context);
    _controller = LoginController(
        SignInUsecasesImpl(LoginRepositoryImpl(AuthService())),
        onSuccess: () => _callbacks.onLoginSuccessAction(context),
        onError: () => _callbacks.onLoginErrorAction(context),
        onNavigate: () =>
            _callbacks.onLoginPushNamedAction(context, '/registerView'));
    ;
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

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
