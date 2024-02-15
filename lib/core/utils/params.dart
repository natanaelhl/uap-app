class PersonParams {
  final String name;
  final String data;

  const PersonParams({required this.name, required this.data});
}

class SignInParams {
  final String email;
  final String password;

  const SignInParams({required this.email, required this.password});
}

class SignUpParams {
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String password;

  const SignUpParams({
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.email,
    required this.password,
  });
}
