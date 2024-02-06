import 'package:flutter/material.dart';
import 'package:uap_app/core/bloc/bloc.dart';
import 'package:uap_app/core/bloc/bloc_event.dart';
import 'package:uap_app/core/bloc/bloc_state.dart';
import 'package:uap_app/features/register/bloc/register_event.dart';
import 'package:uap_app/features/register/params/sign_up_params.dart';
import 'package:uap_app/features/register/usecase/sign_up_usecase.dart';

class RegisterBloc extends Bloc {

  final SignUpUsecase signUpUsecase;

  RegisterBloc(this.signUpUsecase);

  @override
  mapListenEvent(BlocEvent event) {
    if (event is RegisterEventOnReady) {
      dispatchState(BlocStableState());
    }
    else if (event is RegisterEventSignUp) {
      return _handleSignUp(event.params, event.context);
    }
  }


  Future _handleSignUp(SignUpParams params, BuildContext context) async{
    dispatchState(BlocLoadingState());
    var result = await signUpUsecase.call(params);
    result.fold((l){
      dispatchState(BlocStableState());
    }, (r){
      navigateRemoveUntil(context, '/homeView');
    });
  }
}
