import 'package:flutter/material.dart';
import 'package:uap_app/features/person_map/model/person_map_model.dart';
import 'package:uap_app/features/person_map/presentation/widgets/triangle/custom_int_list_widget.dart';
import 'package:uap_app/features/person_map/presentation/widgets/triangle/custom_int_matrix_widget.dart';
import 'package:uap_app/features/person_map/presentation/widgets/triangle/custom_string_widget.dart';


class TriangleWidget extends StatelessWidget {
  final PersonMapModel personMap;
  final Map triangle;
  const TriangleWidget({required this.personMap,super.key,required this.triangle});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          CustomStringWidget(inputString: personMap.name),
          CustomIntListWidget(intList: triangle['head'], index1: personMap.indiceResultante1, index2: personMap.indiceResultante2,),
          CustomIntMatrixWidget(matrix: triangle['body'],),        
        ],
      ),
    );
  }
}