import 'package:flutter/material.dart';
import 'package:uap_app/core/bloc/bloc_state.dart';
import 'package:uap_app/core/colors/app_colors.dart';
import 'package:uap_app/core/widgets/custom_elevated_button_widget.dart';
import 'package:uap_app/core/widgets/custom_text_form_field_widget.dart';
import 'package:uap_app/features/register/bloc/register_bloc.dart';
import 'package:uap_app/features/register/bloc/register_event.dart';
import 'package:uap_app/features/register/params/sign_up_params.dart';
import 'package:uap_app/features/register/view/components/sign_up_component.dart';

class RegisterViewStableState extends StatefulWidget {
  final RegisterBloc bloc;
  final BlocState state;
  const RegisterViewStableState(
      {required this.bloc, required this.state, super.key});

  @override
  State<RegisterViewStableState> createState() =>
      _RegisterViewStableStateState();
}

class _RegisterViewStableStateState extends State<RegisterViewStableState> {
  final TextEditingController firstNameController = TextEditingController();

  final TextEditingController lastNameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  final TextEditingController password1Controller = TextEditingController();

  final TextEditingController password2Controller = TextEditingController();

  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return SignUpComponent(
      firstNameField:
          _buildCustomTextField(firstNameController, 'Primeiro nome'),
      secondNameField: _buildCustomTextField(lastNameController, 'Sobrenome'),
      emailField:
          _buildCustomTextField(emailController, 'E-mail', icon: Icons.email),
      phoneField: _buildCustomTextField(phoneController, '(99) 9999-9999'),
      password1Field: _buildCustomTextField(password1Controller, 'Senha',
          obscureText: obscureText,
          icon: Icons.lock,
          suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  obscureText = !obscureText;
                });
              },
              icon: Icon(
                obscureText ? Icons.visibility : Icons.visibility_off,
                color: Colors.grey,
              ))),
      registerElevatedButton: _buildCustomElevatedRegisterButton(),
      loginElevatedButton: _buildCustomElevatedLoginButton(),
    );
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
        height: 37,
        width: double.infinity,
        color: AppColors.color6.color,
        onPressed: () {
          widget.bloc.dispatchEvent(RegisterEventSignUp(
              context: context,
              params: SignUpParams(
                firstName: firstNameController.text,
                lastName: lastNameController.text,
                email: emailController.text,
                phone: phoneController.text,
                password: password1Controller.text,
              )));
        },
        child: widget.state is BlocLoadingState
            ? SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  color: AppColors.color4.color,
                ))
            : const Text('Continue'));
  }

  Widget _buildCustomElevatedLoginButton() {
    return CustomElevatedButton(
        height: 35,
        color: AppColors.color3.color,
        onPressed: () {
          widget.bloc.dispatchEvent(RegisterEventNavigateNamed(
              context: context, routeName: '/loginView'));
        },
        child: const Text('Já tenho conta'));
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    password1Controller.dispose();
    password2Controller.dispose();
    super.dispose();
  }
}
