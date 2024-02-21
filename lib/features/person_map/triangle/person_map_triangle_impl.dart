import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uap_app/core/services/auth_service.dart';
import 'package:uap_app/features/person_map/model/person_map_model.dart';
import 'package:uap_app/features/person_map/triangle/create_triangletwo.dart';
import 'package:uap_app/features/person_map/triangle/person_map_triangle.dart';
import 'package:uap_app/features/person_map/triangle/triangle_widgettwo.dart';

class PersonMapTriangleImpl implements PersonMapTriangle {
  final AuthService authService;

  const PersonMapTriangleImpl(this.authService);

  @override
  Future<Widget> createTriangleBody(PersonMapModel personMap) async {
    final prefs = await SharedPreferences.getInstance();

    final Map triangle =
        CreateTriangleTwo.reducaoNumerologica(personMap.listNumbers, 0);

    final TriangleWidgetTwo createdTriangle = TriangleWidgetTwo(
      personMap: personMap,
      triangle: triangle,
    );

    return createdTriangle;
  }
}
