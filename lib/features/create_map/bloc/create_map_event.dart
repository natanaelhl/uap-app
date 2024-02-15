import 'package:flutter/material.dart';
import 'package:uap_app/core/bloc/bloc_event.dart';
import 'package:uap_app/core/utils/params.dart';
import 'package:uap_app/features/create_map/models/person_model.dart';

class CreateMapEvent extends BlocEvent {}

class CreateMapEventGetPeopleList implements CreateMapEvent {}

class CreateMapEventCreatePerson implements CreateMapEvent {
  final PersonParams params;

  const CreateMapEventCreatePerson({required this.params});
}

class CreateMapEventDeletePerson implements CreateMapEvent {
  final String id;

  const CreateMapEventDeletePerson({required this.id});
}

class CreateMapEventShowAlertDialog implements CreateMapEvent {
  final BuildContext context;
  final PersonModel person;
  const CreateMapEventShowAlertDialog(
      {required this.context, required this.person});
}

class CreateMapEventEditPerson implements CreateMapEvent {
  final BuildContext context;
  CreateMapEventEditPerson({required this.context});
}
