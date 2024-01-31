import 'package:flutter/material.dart';
import 'package:uap_app/features/person_map/controller/person_map_controller.dart';

const List<String> list = <String>[
  'Triângulo da Vida',
  'Triângulo pessoal',
  'Triângulo social',
  'Triângulo do Destino'
];

class CustomDropDownButton extends StatefulWidget {
  final PersonMapController controller;
  const CustomDropDownButton({required this.controller, super.key});

  @override
  State<CustomDropDownButton> createState() => _CustomDropDownButtonState();
}

class _CustomDropDownButtonState extends State<CustomDropDownButton> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      focusColor: Colors.white,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      isExpanded: true,
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        dropdownValue = value!;

        int index = list.indexOf(dropdownValue);

        widget.controller.changeDropdownTriangle(index);
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
