import 'package:flutter/material.dart';
import 'package:uap_app/core/bloc/bloc.dart';
import 'package:uap_app/core/bloc/bloc_event.dart';
import 'package:uap_app/core/bloc/bloc_state.dart';
import 'package:uap_app/core/utils/params.dart';
import 'package:uap_app/features/login/bloc/login_event.dart';
import 'package:uap_app/features/login/usecases/sign_in_usecases.dart';

class LoginBloc extends Bloc {
  final SignInUsecases signInUsecase;
  LoginBloc(this.signInUsecase);

  @override
  mapListenEvent(BlocEvent event) {
    if (event is LoginEventOnReady) {
      dispatchState(BlocStableState());
    } else if (event is LoginEventNavigateNamed) {
      navigateNamed(event.context, event.routeName);
    } else if (event is LoginEventSignIn) {
      _handleLoginAuthentication(event.context, event.params);
    }
  }

  void _handleLoginAuthentication(
      BuildContext context, SignInParams params) async {
    Map data = loginDataAnalyze(params);
    if (data['error']) {
      showAnalyzeError(context, data['data']);
      dispatchState(BlocErrorState());
    } else {
      dispatchState(BlocLoadingState());
      var result = await signInUsecase.call(params);

      result.fold((l) {
        List<String> error = [];
        error.add(l.message);
        dispatchState(BlocErrorState());
        showAuthenticationError(context, error);
      }, (r) {
        dispatchState(BlocStableState());
        navigateRemoveUntil(context, '/homeView');
      });
    }
  }
}
