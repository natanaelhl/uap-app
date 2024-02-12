class StringTranslator {
  static String get(String value) {
    if (value ==
        "[firebase_auth/invalid-credential] The supplied auth credential is incorrect, malformed or has expired.") {
      return 'E-mail ou senha inválidos;';
    } else if (value ==
        "[firebase_auth/email-already-in-use] The email address is already in use by another account.") {
      return 'E-mail escolhido já existe';
    }
    return '';
  }
}
