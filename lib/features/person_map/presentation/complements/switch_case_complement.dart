import 'package:flutter/material.dart';
import 'package:uap_app/core/utils/numerology_converter.dart';
import 'package:uap_app/features/person_map/controller/person_map_controller.dart';
import 'package:uap_app/features/person_map/model/person_map_model.dart';
import 'package:uap_app/features/person_map/presentation/utils/teste.dart';
import 'package:uap_app/features/person_map/presentation/widgets/triangle/triangle_widget.dart';


class SwitchCaseComplement extends StatelessWidget {
  final PersonMapModel personMap;
  final PersonMapController controller;
   const SwitchCaseComplement({
    required this.controller,
    required this.personMap, 
    super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: controller.selectedIndex, 
      builder: (_, value, __) {
        switch (value) {
          case 0:
            Map triangle = Triangle.reducaoNumerologica(personMap.listNumbers, 0);
            return TriangleWidget(personMap: personMap, triangle: triangle,);
          case 1:
            int numberEdit = NumerologyConverter.updateListWithBirthDateNumerology(
            personMap.dataNasc);

            Map triangle = Triangle.reducaoNumerologica(personMap.listNumbers, numberEdit);
 
            return TriangleWidget(personMap: personMap, triangle: triangle,);
          case 2:
            int numberEdit = NumerologyConverter.extractAndReduceMonth(
            personMap.dataNasc);

            Map triangle = Triangle.reducaoNumerologica(personMap.listNumbers, numberEdit);
 
            return TriangleWidget(personMap: personMap, triangle: triangle,);
          case 3:
            int numberEdit = NumerologyConverter.calculateNumerology(
            personMap.dataNasc);

            Map triangle = Triangle.reducaoNumerologica(personMap.listNumbers, numberEdit);
 
            return TriangleWidget(personMap: personMap, triangle: triangle,);
          default:
            return const Text('Conteúdo padrão');
        }
      });
  }
}