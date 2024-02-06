import 'package:flutter/material.dart';
import 'package:uap_app/core/bloc/bloc_state.dart';
import 'package:uap_app/core/widgets/custom_elevated_button_widget.dart';
import 'package:uap_app/core/widgets/custom_text_form_field_widget.dart';
import 'package:uap_app/features/register/bloc/register_bloc.dart';
import 'package:uap_app/features/register/bloc/register_event.dart';
import 'package:uap_app/features/register/controller/register_controller.dart';
import 'package:uap_app/features/register/params/sign_up_params.dart';

Widget buildRegisterForm(
    BuildContext context,
    final BlocState state,
    final RegisterBloc bloc,
    RegisterController controller,
    TextEditingController emailController,
    TextEditingController passwordController) {
  return Column(
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
      _buildRegisterButton(
          context, bloc, state, controller, emailController, passwordController),
      const SizedBox(
        height: 20,
      ),
      _buildLoginButton(controller)
    ],
  );
}

Widget _buildEmailField(TextEditingController emailController) {
  return CustomTextFormField(controller: emailController);
}

Widget _buildPasswordField(TextEditingController passwordController) {
  return CustomTextFormField(
    controller: passwordController,
    obscureText: true,
  );
}

Widget _buildRegisterButton(
    BuildContext context,
    RegisterBloc bloc,
    BlocState state,
    RegisterController controller,
    TextEditingController emailController,
    TextEditingController passwordController) {
  return CustomElevatedButton(
      onPressed: () {

        bloc.dispatchEvent(RegisterEventSignUp(
            context: context,
            params: SignUpParams(
              email: emailController.text,
              password: passwordController.text,
            )));
      },
      child: state is BlocLoadingState ? CircularProgressIndicator.adaptive() :Text('teste'));
}

Widget _buildLoginButton(RegisterController controller) {
  return CustomElevatedButton(
      onPressed: () => controller.handleNavigateFeature(),
      child: const Text('Eu já tenho conta'));
}
