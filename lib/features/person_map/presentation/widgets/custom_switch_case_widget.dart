import 'package:flutter/material.dart';
import 'package:uap_app/features/person_map/functions/create_triangle.dart';
import 'package:uap_app/features/person_map/functions/numerology_converter.dart';
import 'package:uap_app/features/person_map/model/person_map_model.dart';
import 'package:uap_app/features/person_map/presentation/widgets/triangle/triangle_widget.dart';

Widget buildContent(int value, PersonMapModel personMap) {
  switch (value) {
    case 0:
      final Map triangle =
          CreateTriangle.reducaoNumerologica(personMap.listNumbers, 0);
      return TriangleWidget(
        personMap: personMap,
        triangle: triangle,
      );
    case 1:
      final int numberEdit =
          NumerologyConverter.updateListWithBirthDateNumerology(
              personMap.dataNasc);
      final Map triangle =
          CreateTriangle.reducaoNumerologica(personMap.listNumbers, numberEdit);
      return TriangleWidget(
        personMap: personMap,
        triangle: triangle,
      );
    case 2:
      final int numberEdit =
          NumerologyConverter.extractAndReduceMonth(personMap.dataNasc);
      final Map triangle =
          CreateTriangle.reducaoNumerologica(personMap.listNumbers, numberEdit);
      return TriangleWidget(
        personMap: personMap,
        triangle: triangle,
      );
    case 3:
      final int numberEdit =
          NumerologyConverter.calculateNumerology(personMap.dataNasc);
      final Map triangle =
          CreateTriangle.reducaoNumerologica(personMap.listNumbers, numberEdit);
      return TriangleWidget(
        personMap: personMap,
        triangle: triangle,
      );
    default:
      return const Text('Conteúdo padrão');
  }
}
