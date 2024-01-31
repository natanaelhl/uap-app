import 'package:flutter/material.dart';
import 'package:uap_app/features/login/params/sign_in_params.dart';
import 'package:uap_app/features/login/usecases/sign_in_usecases.dart';

class LoginController {
  final SignInUsecases usecases;
  final VoidCallback onSuccess;
  final VoidCallback onError;
  final VoidCallback onNavigate;
  LoginController(
    this.usecases, {
    required this.onSuccess,
    required this.onError,
    required this.onNavigate,
  });

  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  Future handleLogin(SignInParams params) async {
    isLoading.value = true;
    usecases.call(params).then((value) => value.fold((l) {
          isLoading.value = false;
          onError();
        }, (r) {
          isLoading.value = false;
          onSuccess();
        }));
  }

  handleNavigateFeature() {
    onNavigate();
  }
}
