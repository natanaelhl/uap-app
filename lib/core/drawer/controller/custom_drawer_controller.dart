import 'package:flutter/material.dart';
import 'package:uap_app/core/drawer/usecases/logout_usecase.dart';

class CustomDrawerController {
  final SignOutUsecase signOutUsecase;
  final VoidCallback onSucess;
  final VoidCallback onError;

  CustomDrawerController(this.signOutUsecase,
      {required this.onSucess, required this.onError});

  Future<void> signOut() async {
    var result = await signOutUsecase.signOut();

    result.fold((l) {
      onError();
    }, (r) {
      onSucess();
    });
  }
}
