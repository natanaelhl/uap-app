import 'package:flutter/material.dart';
import 'package:uap_app/features/create_map/controller/create_map_controller.dart';
import 'package:uap_app/features/create_map/view/complements/complement_form_map.dart';

Widget buildCreateMapView(CreateMapController controller) {
  return Padding(
    padding: const EdgeInsets.all(20),
    child: Column(
      children: [
        Row(
          children: [
            Expanded(child: _buildComplementFormMap(controller)),
            const SizedBox(
              width: 40,
            ),
          ],
        )
      ],
    ),
  );
}

Widget _buildComplementFormMap(CreateMapController controller) {
  return ComplementFormMap(
    controller: controller,
  );
}
