import 'package:flutter/material.dart';
import 'package:uap_app/core/utils/numerologia.dart';
import 'package:uap_app/core/utils/params.dart';
import 'package:uap_app/core/validators/string_validator.dart';
import 'package:uap_app/core/widgets/custom_auth_error_alert_dialog.dart';
import 'package:uap_app/features/create_map/models/person_model.dart';
import 'package:uap_app/features/create_map/view/widgets/custom_edit_alert_dialog.dart';
import 'package:uap_app/features/person_map/model/person_map_model.dart';

mixin class HudMixins {
  Future showEditContact(BuildContext context, PersonModel person) async {
    return await showDialog(
        context: context,
        builder: (context) => CustomEditAlertDialog(person: person));
  }

  void navigateRemoveUntil(BuildContext context, String routeName) {
    Navigator.of(context).pushNamedAndRemoveUntil(routeName, (route) => false);
  }

  void navigateNamed(BuildContext context, String routeName) {
    Navigator.of(context).pushNamed(routeName);
  }

  void navigatePop(BuildContext context) {
    Navigator.of(context).pop();
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

  Map registerDataAnalyze(params) {
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

  PersonMapModel getMapArcane(
      String fullName, String numberList, String dataNasc) {
    Map result =
        Numerologia.calcularNumerologia(fullName, numberList, dataNasc);

    PersonMapModel personMap = PersonMapModel(
        name: result['name'],
        arcanoAtual: result['arcanoAtual'],
        listNumbers: result['list_numbers'],
        faseAtual: result['faseAtual'],
        indiceResultante1: result['indiceResultante1'],
        indiceResultante2: result['indiceResultante2'],
        trianglelist: result['triangle_list'],
        dataNasc: result['data_nasc']);

    return personMap;
  }
}
