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
    } else if (event is RegisterEventSignUp) {
      Map analyze = registerDataAnalyze(event.params);

      return analyze['error']
          ? _handleShowError(analyze['data'], event.context)
          : _handleSignUp(event.params, event.context);
    } else if (event is RegisterEventNavigateNamed) {
      navigateNamed(event.context, event.routeName);
    }
  }

  _handleShowError(List data, context) {
    inspect(data);
    testeError(context, data);
  }

  Future _handleSignUp(SignUpParams params, BuildContext context) async {
    dispatchState(BlocLoadingState());

    var result = await signUpUsecase.call(params);

    result.fold((l) {
      dispatchState(BlocStableState());
    }, (r) {
      addUserInfoUsecase.call(params);
      navigateRemoveUntil(context, '/homeView');
    });
  }
}
