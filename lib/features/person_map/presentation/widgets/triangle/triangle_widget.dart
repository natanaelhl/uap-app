// import 'package:flutter/material.dart';
// import 'package:uap_app/features/person_map/model/person_map_model.dart';
// import 'package:uap_app/features/person_map/presentation/widgets/triangle/custom_int_list_widget.dart';
// import 'package:uap_app/features/person_map/presentation/widgets/triangle/custom_int_matrix_widget.dart';
// import 'package:uap_app/features/person_map/presentation/widgets/triangle/custom_string_widget.dart';

// class TriangleWidget extends StatefulWidget {
//   final PersonMapModel personMap;
//   final Map triangle;
//   const TriangleWidget(
//       {required this.personMap, super.key, required this.triangle});

//   @override
//   State<TriangleWidget> createState() => _TriangleWidgetState();
// }

// class _TriangleWidgetState extends State<TriangleWidget> {
//   Map numerologicNumbers = {};
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       child: Column(
//         children: [
//           CustomStringWidget(inputString: widget.personMap.name),
//           CustomIntListWidget(
//             intList: widget.triangle['head'],
//             index1: widget.personMap.indiceResultante1,
//             index2: widget.personMap.indiceResultante2,

//           ),
//           CustomIntMatrixWidget(
//             matrix: widget.triangle['body'],
//           ),
//         ],
//       ),
//     );
//   }
// }
