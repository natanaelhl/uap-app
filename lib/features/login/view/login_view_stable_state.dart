import 'package:flutter/material.dart';
import 'package:uap_app/core/bloc/bloc_state.dart';
import 'package:uap_app/core/colors/app_colors.dart';
import 'package:uap_app/core/widgets/custom_elevated_button_widget.dart';
import 'package:uap_app/core/widgets/custom_text_form_field_widget.dart';
import 'package:uap_app/features/login/bloc/login_bloc.dart';
import 'package:uap_app/features/login/bloc/login_event.dart';
import 'package:uap_app/features/login/params/sign_in_params.dart';
import 'package:uap_app/features/login/view/components/sign_in_component.dart';

class LoginViewStableState extends StatefulWidget {
  final LoginBloc bloc;
  final BlocState state;
  const LoginViewStableState(
      {super.key, required this.bloc, required this.state});

  @override
  State<LoginViewStableState> createState() => _LoginViewStableStateState();
}

class _LoginViewStableStateState extends State<LoginViewStableState> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SignInComponent(
        emailField: _buildCustomTextField(emailController, 'E-mail'),
        passwordField: _buildCustomTextField(passwordController, 'Senha'),
        registerElevatedButton: _buildCustomElevatedRegisterButton(),
        loginElevatedButton: _buildCustomElevatedLoginButton());
  }

  Widget _buildCustomTextField(
    TextEditingController controller,
    String hintText, {
    bool obscureText = false,
    IconData? icon,
    Widget? suffixIcon,
  }) {
    return CustomTextFormField(
      suffixIcon: suffixIcon,
      icon: icon,
      obscureText: obscureText,
      controller: controller,
      hintText: hintText,
    );
  }

  Widget _buildCustomElevatedRegisterButton() {
    return CustomElevatedButton(
        height: 35,
        color: AppColors.color6.color,
        onPressed: () {
          widget.bloc.dispatchEvent(LoginEventNavigateNamed(
              context: context, routeName: '/registerView'));
        },
        child: widget.state is BlocLoadingState
            ? SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  color: AppColors.color4.color,
                ))
            : const Text('Registre-se'));
  }

  Widget _buildCustomElevatedLoginButton() {
    return CustomElevatedButton(
        width: double.infinity,
        height: 37,
        color: AppColors.color3.color,
        onPressed: () {
          widget.bloc.dispatchEvent(LoginEventSignIn(
              context: context,
              params: SignInParams(
                  email: emailController.text,
                  password: passwordController.text)));
        },
        child: const Text('Faça Login'));
  }
}
