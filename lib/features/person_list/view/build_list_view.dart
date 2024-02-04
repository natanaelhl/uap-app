import 'package:flutter/material.dart';
import 'package:uap_app/features/person_list/view/complements/complement_form_map.dart';

Widget buildPersonListView() {
  return Padding(
    padding: const EdgeInsets.all(20),
    child: Column(
      children: [Row(
        children: [
          Expanded(child: _buildComplementFormMap()),
          SizedBox(width: 40,),
          Expanded(child: _buildComplementFormMap()),
        ],
      )],
    ),
  );
}

Widget _buildComplementFormMap() {
  return ComplementFormMap();
}
