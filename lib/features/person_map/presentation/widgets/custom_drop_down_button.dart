import 'package:flutter/material.dart';

const List<String> list = <String>[
  'Triângulo da Vida',
  'Triângulo pessoal',
  'Triângulo social',
  'Triângulo do Destino'
];

class CustomDropDownButton extends StatefulWidget {
  final Function(int) onSelected;
  const CustomDropDownButton({required this.onSelected, super.key});

  @override
  State<CustomDropDownButton> createState() => _CustomDropDownButtonState();
}

class _CustomDropDownButtonState extends State<CustomDropDownButton> {
  String dropdownValue = list.first;
  int index = 0;
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
      onChanged: (String? newValue) {
        setState(() {
          int index = list.indexOf(newValue!);
          widget.onSelected(index);
        });
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
