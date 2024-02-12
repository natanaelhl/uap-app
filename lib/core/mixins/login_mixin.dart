import 'package:uap_app/core/validators/string_validator.dart';
import 'package:uap_app/features/register/params/sign_up_params.dart';

mixin class AuthMixin {
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
