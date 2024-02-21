import 'package:flutter/material.dart';
import 'package:uap_app/features/person_map/functions/create_triangle.dart';
import 'package:uap_app/features/person_map/functions/numerology_converter.dart';
import 'package:uap_app/features/person_map/model/person_map_model.dart';
import 'package:uap_app/features/person_map/triangle/triangle_widgettwo.dart';

class BuildContextTriangle extends StatefulWidget {
  final int value;
  final PersonMapModel personMap;
  const BuildContextTriangle({
    super.key,
    required this.value,
    required this.personMap,
  });

  @override
  State<BuildContextTriangle> createState() => _BuildContextTriangleState();
}

class _BuildContextTriangleState extends State<BuildContextTriangle> {
  @override
  Widget build(BuildContext context) {
    print('teste');
    switch (widget.value) {
      case 0:
        final Map triangle =
            CreateTriangle.reducaoNumerologica(widget.personMap.listNumbers, 0);
        return TriangleWidgetTwo(
          personMap: widget.personMap,
          triangle: triangle,
        );
      case 1:
        final int numberEdit =
            NumerologyConverter.updateListWithBirthDateNumerology(
                widget.personMap.dataNasc);
        final Map triangle = CreateTriangle.reducaoNumerologica(
            widget.personMap.listNumbers, numberEdit);
        return TriangleWidgetTwo(
          personMap: widget.personMap,
          triangle: triangle,
        );
      case 2:
        final int numberEdit = NumerologyConverter.extractAndReduceMonth(
            widget.personMap.dataNasc);
        final Map triangle = CreateTriangle.reducaoNumerologica(
            widget.personMap.listNumbers, numberEdit);
        return TriangleWidgetTwo(
          personMap: widget.personMap,
          triangle: triangle,
        );
      case 3:
        final int numberEdit =
            NumerologyConverter.calculateNumerology(widget.personMap.dataNasc);
        final Map triangle = CreateTriangle.reducaoNumerologica(
            widget.personMap.listNumbers, numberEdit);
        return TriangleWidgetTwo(
          personMap: widget.personMap,
          triangle: triangle,
        );
      default:
        return const Text('Conteúdo padrão');
    }
  }
}
