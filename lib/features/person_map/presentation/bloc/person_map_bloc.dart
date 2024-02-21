import 'package:flutter/material.dart';
import 'package:uap_app/core/bloc/bloc.dart';
import 'package:uap_app/core/bloc/bloc_event.dart';
import 'package:uap_app/core/bloc/bloc_state.dart';
import 'package:uap_app/features/create_map/models/person_model.dart';
import 'package:uap_app/features/person_map/functions/data_formatter.dart';
import 'package:uap_app/features/person_map/functions/numerology_converter.dart';
import 'package:uap_app/features/person_map/model/person_map_model.dart';
import 'package:uap_app/features/person_map/presentation/bloc/person_map_event.dart';
import 'package:uap_app/features/person_map/triangle/person_map_triangle.dart';

class PersonMapBloc extends Bloc {
  final PersonMapTriangle personMapTriangle;

  PersonMapBloc(this.personMapTriangle);

  @override
  mapListenEvent(BlocEvent event) {
    if (event is PersonMapEventShowAlertDialog) {
      _handleBuildTriangleNumerologic(
          event.customAlertDialog, event.context, event.person);
    } else if (event is PersonMapEventOnReady) {
      _handleOnReady(event.person);
    }
  }

  _handleOnReady(PersonModel person) {
    final String numberList =
        NumerologyConverter.convertNameToNumbers(person.name);

    PersonMapModel personMap = getMapArcane(
        person.name, numberList, DateFormatter.convertDateFormat(person.data));

    dispatchState(BlocStableState(data: personMap));
  }

  _handleBuildTriangleNumerologic(
      AlertDialog customAlertDialog, context, PersonModel person) {
    showDialog(context: context, builder: (context) => customAlertDialog);
  }
}
