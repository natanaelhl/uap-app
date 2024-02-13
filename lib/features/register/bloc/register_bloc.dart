import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:uap_app/core/bloc/bloc.dart';
import 'package:uap_app/core/bloc/bloc_event.dart';
import 'package:uap_app/core/bloc/bloc_state.dart';
import 'package:uap_app/features/register/bloc/register_event.dart';
import 'package:uap_app/features/register/params/sign_up_params.dart';
import 'package:uap_app/features/register/usecase/add_user_info_usecase.dart';
import 'package:uap_app/features/register/usecase/sign_up_usecase.dart';

class RegisterBloc extends Bloc {
  final SignUpUsecase signUpUsecase;
  final AddUserInfoUsecase addUserInfoUsecase;

  RegisterBloc(this.signUpUsecase, this.addUserInfoUsecase);

  @override
  mapListenEvent(BlocEvent event) {
    if (event is RegisterEventOnReady) {
      dispatchState(BlocStableState());
    } else if (event is RegisterEventNavigateNamed) {
      navigatePop(event.context);
    } else if (event is RegisterEventSignUp) {
      _handleRegisterAuthentication(event.context, event.params);
    }
  }

  void _handleRegisterAuthentication(
      BuildContext context, SignUpParams params) async {
    dispatchState(BlocLoadingState());
    Map data = registerDataAnalyze(params);
    if (data['error']) {
      showAnalyzeError(context, data['data']);
      dispatchState(BlocErrorState());
    } else {
      var result = await signUpUsecase.call(params);

      result.fold((l) {
        inspect(l);
        List<String> error = [];
        error.add(l.message);

        showAuthenticationError(context, error);
        dispatchState(BlocErrorState());
      }, (r) {
        navigateRemoveUntil(context, '/homeView');
      });
    }
  }
}
