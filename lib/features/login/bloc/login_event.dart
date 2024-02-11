import 'package:flutter/material.dart';
import 'package:uap_app/core/bloc/bloc_event.dart';

class LoginEvent extends BlocEvent {}

class LoginEventOnReady implements LoginEvent {}

class LoginEventNavigateNamed implements LoginEvent {
  final BuildContext context;
  final String routeName;

  const LoginEventNavigateNamed(
      {required this.context, required this.routeName});
}
