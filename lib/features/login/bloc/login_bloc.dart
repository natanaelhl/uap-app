import 'package:uap_app/core/bloc/bloc.dart';
import 'package:uap_app/core/bloc/bloc_event.dart';
import 'package:uap_app/core/bloc/bloc_state.dart';
import 'package:uap_app/core/mixins/hud_mixin.dart';
import 'package:uap_app/features/login/bloc/login_event.dart';

class LoginBloc extends Bloc with HudMixins {
  @override
  mapListenEvent(BlocEvent event) {
    if (event is LoginEventOnReady) {
      dispatchState(BlocStableState());
    } else if (event is LoginEventNavigateNamed) {
      navigateNamed(event.context, event.routeName);
    }
  }
}
