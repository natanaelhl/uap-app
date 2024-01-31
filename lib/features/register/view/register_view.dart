import 'package:flutter/material.dart';
import 'package:uap_app/core/services/auth_service.dart';
import 'package:uap_app/features/register/callbacks/register_callbacks.dart';
import 'package:uap_app/features/register/controller/register_controller.dart';
import 'package:uap_app/features/register/repository/register_repository_impl.dart';
import 'package:uap_app/features/register/usecase/sign_up_usecase_impl.dart';
import 'package:uap_app/features/register/view/build_register_form.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  late final RegisterController _controller;
  late final RegisterCallbacks _callbacks;

  late final TextEditingController emailController;
  late final TextEditingController passwordController;

  @override
  void initState() {
    super.initState();

    _callbacks = RegisterCallbacks(context: context);
    _controller = RegisterController(
        SignUpUsecaseImpl(RegisterRepositoryImpl(AuthService())),
        onSuccess: () => _callbacks.onRegisterSuccessAction(context),
        onError: () => _callbacks.onRegisterErrorAction(),
        onNavigate: () => _callbacks.onNavigateFeatureAction());

    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildRegisterForm(
          context, _controller, emailController, passwordController),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
