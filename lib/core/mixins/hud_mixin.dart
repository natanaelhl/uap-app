import 'package:flutter/material.dart';
import 'package:uap_app/core/colors/app_colors.dart';
import 'package:uap_app/core/validators/string_validator.dart';
import 'package:uap_app/core/widgets/custom_elevated_button_widget.dart';
import 'package:uap_app/features/register/params/sign_up_params.dart';

mixin class HudMixins {
  void navigateRemoveUntil(BuildContext context, String routeName) {
    Navigator.of(context).pushNamedAndRemoveUntil(routeName, (route) => false);
  }

  void navigateNamed(BuildContext context, String routeName) {
    Navigator.of(context).pushNamed(routeName);
  }

  void testeError(BuildContext context, List data) {
    showDialog(context: context, builder: (context) => AlertDialog(
      title: Text('Dados incorretos', style: TextStyle(letterSpacing: 3, fontSize: 26, fontWeight: FontWeight.bold, color: AppColors.color3.color),),
      content: SizedBox(
        width: MediaQuery.of(context).size.width * 0.33,
        height: MediaQuery.of(context).size.height * 0.23,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(data.length, (index) => Text(data[index])),
          
        ),
      ), actions: [CustomElevatedButton(
        onPressed: (){
          Navigator.pop(context);
      }, color: AppColors.color6.color, width: double.infinity, child: const Text("Tentar novamente"))],
    ));
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
}
