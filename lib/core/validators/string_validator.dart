import 'package:string_validator/string_validator.dart' as validator;

class StringValidator {
  static String? emailValidator(String value) {
    if (!validator.isEmail(value)) {
      return '* E-mail inválido;';
    }
    return null;
  }

  static String? firstNameValidator(String value) {
    if (value.isEmpty) {
      return '* Primeiro nome inválido;';
    }
    return null;
  }

  static String? lastNameValidator(String value) {
    if (value.isEmpty) {
      return '* Sobrenome inválido;';
    }
    return null;
  }

  static String? phoneValidator(String value) {
    if (value.isEmpty) {
      return '* Preencha o número de celular;';
    } else if (value.length < 15){
      return '* Digite um número de celular válido;';
    } else {
      return null;
    }
  }

  static String? passwordValidator(String value) {
    if (value.isEmpty) {
      return '* Senha inválida;';
    } else if (value.length < 8){
      return '* A senha precisa ter no minimo 8 caracteres;';
    } else {
      return null;
    }
  }
}
