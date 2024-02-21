import 'package:flutter/material.dart';
import 'package:uap_app/core/bloc/bloc_event.dart';
import 'package:uap_app/features/create_map/models/person_model.dart';

class PersonMapEvent extends BlocEvent {}

class PersonMapEventOnReady implements PersonMapEvent {
  final PersonModel person;

  const PersonMapEventOnReady({required this.person});
}

class PersonMapEventShowAlertDialog implements PersonMapEvent {
  final AlertDialog customAlertDialog;
  final PersonModel person;
  final BuildContext context;

  const PersonMapEventShowAlertDialog(
      {required this.customAlertDialog,
      required this.context,
      required this.person});
}
