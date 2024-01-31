import 'package:flutter/material.dart';
import 'package:uap_app/features/register/params/sign_up_params.dart';
import 'package:uap_app/features/register/usecase/sign_up_usecase.dart';

class RegisterController {
  final SignUpUsecase usecases;
  final VoidCallback onSuccess;
  final VoidCallback onError;
  final VoidCallback onNavigate;

  RegisterController(this.usecases,
      {required this.onSuccess,
      required this.onError,
      required this.onNavigate});

  ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  Future handleRegister(SignUpParams params) async {
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
