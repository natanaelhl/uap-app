import 'package:flutter/material.dart';
import 'package:uap_app/core/bloc/bloc_event.dart';
import 'package:uap_app/features/register/params/sign_up_params.dart';

class RegisterEvent extends BlocEvent {}

class RegisterEventOnReady implements RegisterEvent{}

class RegisterEventSignUp implements RegisterEvent {
  final BuildContext context;
  final SignUpParams params;

  const RegisterEventSignUp({
    required this.context,
    required this.params,
  });
}

