import 'package:flutter/material.dart';
import 'package:uap_app/features/register/repository/register_repository.dart';

class RegisterController {
  final RegisterRepository repository;
  final VoidCallback onSuccess;
  final VoidCallback onError;
  final VoidCallback onNavigate;

  RegisterController(
    this.repository, 
    { required this.onSuccess, 
      required this.onError,
      required this.onNavigate});

  ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  Future handleRegister (String pass, String password) async{
    try {
      isLoading.value = true;
      await repository.register(pass, password);
      onSuccess();      
    } on Exception catch (e) {
      isLoading.value = false;
      onError();
    }
  }

  handleNavigateFeature(){
    onNavigate();
  }

}