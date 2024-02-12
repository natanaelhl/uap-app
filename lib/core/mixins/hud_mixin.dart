import 'package:flutter/material.dart';
import 'package:uap_app/core/validators/string_validator.dart';
import 'package:uap_app/core/widgets/custom_auth_error_alert_dialog.dart';
import 'package:uap_app/features/login/params/sign_in_params.dart';
import 'package:uap_app/features/register/params/sign_up_params.dart';

mixin class HudMixins {
  void navigateRemoveUntil(BuildContext context, String routeName) {
    Navigator.of(context).pushNamedAndRemoveUntil(routeName, (route) => false);
  }

  void navigateNamed(BuildContext context, String routeName) {
    Navigator.of(context).pushNamed(routeName);
  }

  void showAuthenticationError(BuildContext context, List data) {
    showDialog(
        context: context,
        builder: (context) => CustomAuthErrorAlertDialog(data: data));
  }

  void showAnalyzeError(BuildContext context, List data) {
    showDialog(
        context: context,
        builder: (context) => CustomAuthErrorAlertDialog(data: data));
  }

  Map registerDataAnalyze(SignUpParams params) {
    var emailError = StringValidator.emailValidator(params.email);
    var firstNameError = StringValidator.firstNameValidator(params.firstName);
    var lastNameError = StringValidator.lastNameValidator(params.lastName);
    var phoneError = StringValidator.phoneValidator(params.phone);
    var passwordError = StringValidator.passwordValidator(params.password);

    var dataErros = [
      if (emailError != null) emailError,
      if (firstNameError != null) firstNameError,
      if (lastNameError != null) lastNameError,
      if (phoneError != null) phoneError,
      if (passwordError != null) passwordError,
    ];

    if (dataErros.isEmpty) {
      return {'error': false};
    } else {
      return {'error': true, 'data': dataErros};
    }
  }

  Map loginDataAnalyze(SignInParams params) {
    var emailError = StringValidator.emailValidator(params.email);
    var passwordError = StringValidator.passwordValidator(params.password);

    var dataErros = [
      if (emailError != null) emailError,
      if (passwordError != null) passwordError,
    ];

    if (dataErros.isEmpty) {
      return {'error': false};
    } else {
      return {'error': true, 'data': dataErros};
    }
  }
}
