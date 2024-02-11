import 'dart:async';

import 'package:uap_app/core/bloc/bloc_event.dart';
import 'package:uap_app/core/bloc/bloc_state.dart';
import 'package:uap_app/core/mixins/hud_mixin.dart';

abstract class Bloc with HudMixins {
  late StreamController<BlocState> _state;
  Stream<BlocState> get state => _state.stream;

  late StreamController<BlocEvent> _event;
  Sink<BlocEvent> get event => _event.sink;

  Bloc() {
    _state = StreamController.broadcast();
    _event = StreamController.broadcast();

    _event.stream.listen(mapListenEvent);
  }

  dispatchState(BlocState state) {
    _state.add(state);
  }

  dispatchEvent(BlocEvent event) {
    _event.add(event);
  }

  mapListenEvent(BlocEvent event);

  void dispose() {
    _state.close();
    _event.close();
  }
}
