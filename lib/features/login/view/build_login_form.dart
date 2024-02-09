import 'package:flutter/material.dart';
import 'package:uap_app/core/colors/app_colors.dart';
import 'package:uap_app/core/widgets/custom_elevated_button_widget.dart';
import 'package:uap_app/core/widgets/custom_text_field_widget.dart';
import 'package:uap_app/core/widgets/custom_text_form_field_widget.dart';
import 'package:uap_app/features/login/controller/login_controller.dart';
import 'package:uap_app/features/login/params/sign_in_params.dart';

Widget buildLoginForm(
    BuildContext context,
    LoginController controller,
    TextEditingController emailController,
    TextEditingController passwordController) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 40),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildEmailField(emailController),
        const SizedBox(
          height: 20,
        ),
        _buildPasswordField(passwordController),
        const SizedBox(
          height: 20,
        ),
        _buildLoginButton(
          context,
          controller,
          emailController,
          passwordController,
        ),
        const SizedBox(height: 20),
        _buildRegisterButton(context, controller),
      ],
    ),
  );
}

Widget _buildEmailField(TextEditingController emailController) {
  return CustomTextField(
      hintText: '',
      focusedColor: AppColors.color4.color,
      controller: emailController);
}

Widget _buildPasswordField(TextEditingController passwordController) {
  return CustomTextFormField(
    controller: passwordController,
    obscureText: true,
  );
}

Widget _buildLoginButton(
  BuildContext context,
  LoginController controller,
  TextEditingController emailController,
  TextEditingController passwordController,
) {
  return ValueListenableBuilder(
      valueListenable: controller.isLoading,
      builder: (_, isLoading, __) => CustomElevatedButton(
            color: AppColors.color3.color,
            onPressed: () {
              SignInParams params = SignInParams(
                  email: emailController.text,
                  password: passwordController.text);
              controller.handleLogin(params);
            },
            child: isLoading
                ? const CircularProgressIndicator.adaptive()
                : const Text('Faça Login'),
          ));
}

Widget _buildRegisterButton(BuildContext context, LoginController controller) {
  return CustomElevatedButton(
    color: AppColors.color3.color,
    onPressed: () {
      controller.handleNavigateFeature();
    },
    child: const Text('Crie a sua conta'),
  );
}
