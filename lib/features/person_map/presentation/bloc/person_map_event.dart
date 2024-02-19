import 'package:flutter/material.dart';
import 'package:uap_app/core/bloc/bloc_event.dart';
import 'package:uap_app/features/create_map/models/person_model.dart';

class PersonMapEvent extends BlocEvent {}

class PersonMapEventShowAlertDialog implements PersonMapEvent {
  final BuildContext context;
  final PersonModel person;

  const PersonMapEventShowAlertDialog(
      {required this.context, required this.person});
}
