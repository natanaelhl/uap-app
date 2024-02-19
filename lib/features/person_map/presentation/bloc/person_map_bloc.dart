import 'package:flutter/material.dart';
import 'package:uap_app/core/bloc/bloc.dart';
import 'package:uap_app/core/bloc/bloc_event.dart';
import 'package:uap_app/features/create_map/models/person_model.dart';
import 'package:uap_app/features/person_map/functions/data_formatter.dart';
import 'package:uap_app/features/person_map/functions/numerology_converter.dart';
import 'package:uap_app/features/person_map/model/person_map_model.dart';
import 'package:uap_app/features/person_map/presentation/bloc/person_map_event.dart';

class PersonMapBloc extends Bloc {
  @override
  mapListenEvent(BlocEvent event) {
    if (event is PersonMapEventShowAlertDialog) {
      _handleShowAlertDialog(event.context, event.person);
    }
  }

  _handleShowAlertDialog(BuildContext context, PersonModel person) {
    final String numberList =
        NumerologyConverter.convertNameToNumbers(person.name);

    final PersonMapModel personMap = getMapArcane(
        person.name, numberList, DateFormatter.convertDateFormat(person.data));

    showTriangle(context, personMap);
  }
}
