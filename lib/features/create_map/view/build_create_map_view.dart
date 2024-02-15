import 'package:flutter/material.dart';
import 'package:uap_app/features/create_map/bloc/create_map_bloc.dart';
import 'package:uap_app/features/create_map/models/person_model.dart';
import 'package:uap_app/features/create_map/view/complements/complement_form_map.dart';
import 'package:uap_app/features/create_map/view/complements/complement_list_map.dart';

Widget buildCreateMapView(
  CreateMapBloc bloc,
  List<PersonModel> data,
) {
  return Padding(
    padding: const EdgeInsets.all(60),
    child: Row(
      children: [
        Expanded(child: _buildComplementFormMap(bloc)),
        const SizedBox(
          width: 40,
        ),
        Expanded(
            child: ComplementListMap(
          bloc: bloc,
          listPerson: data,
        )),
      ],
    ),
  );
}

Widget _buildComplementFormMap(CreateMapBloc bloc) {
  return ComplementFormMap(
    bloc: bloc,
  );
}
