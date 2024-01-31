import 'package:flutter/material.dart';
import 'package:uap_app/core/widgets/custom_elevated_button_widget.dart';
import 'package:uap_app/core/widgets/custom_text_form_field_widget.dart';
import 'package:uap_app/features/register/controller/register_controller.dart';

Widget buildRegisterForm(
  BuildContext context,
  RegisterController controller,
  TextEditingController emailController,
  TextEditingController passwordController) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      _buildEmailField(emailController),
      const SizedBox(height: 20,),
      _buildPasswordField(passwordController),
      const SizedBox(height: 20,),
      _buildRegisterButton(context, controller, emailController, passwordController),
      const SizedBox(height: 20,),
      _buildLoginButton(controller)

    ],
  );
}

Widget _buildEmailField(TextEditingController emailController){
  return CustomTextFormField(controller: emailController);
}

Widget _buildPasswordField(TextEditingController passwordController){
  return CustomTextFormField(
    controller: passwordController,
    obscureText: true,);
}

Widget _buildRegisterButton(
  BuildContext context,
  RegisterController controller,
  TextEditingController emailController,
  TextEditingController passwordController){
  return ValueListenableBuilder<bool>(
    valueListenable: controller.isLoading,
    builder: (_, isLoading, __) =>  
      CustomElevatedButton(
        onPressed: () => 
        controller.handleRegister(emailController.text, passwordController.text), 
        child: isLoading
         ? const CircularProgressIndicator.adaptive()
         : const Text('Registre-se'),)
  );
}

Widget _buildLoginButton(RegisterController controller){
  return CustomElevatedButton(
    onPressed: () => 
    controller.handleNavigateFeature(), 
    child: const Text('Eu já tenho conta'));
}