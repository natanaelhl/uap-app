import 'package:flutter/material.dart';
import 'package:uap_app/features/person_map/model/person_map_model.dart';

abstract class PersonMapTriangle {
  Future<Widget> createTriangleBody(PersonMapModel personMap);
}
