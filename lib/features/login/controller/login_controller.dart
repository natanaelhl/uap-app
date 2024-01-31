import 'package:flutter/material.dart';
import 'package:uap_app/features/login/repository/login_repository.dart';

class LoginController {
  final LoginRepository repository;
  final VoidCallback onSuccess;
  final VoidCallback onError;
  final VoidCallback onNavigate;
  LoginController(
    this.repository, 
    {
      required this.onSuccess, 
      required this.onError, 
      required this.onNavigate,});

  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);


  Future handleLogin(String pass, String password,) async{
    try{
      isLoading.value = true;
      await repository.signIn(pass, password);
      isLoading.value = false;
      onSuccess();
      
  } catch (e) {
    isLoading.value = false;
    onError();
    }
  }

  handleNavigateFeature() {
    print('tetse');
    onNavigate();
  }
}
