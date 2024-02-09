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
