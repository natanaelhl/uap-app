import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:uap_app/core/colors/app_colors.dart';
import 'package:uap_app/core/widgets/custom_text_field_widget.dart';
import 'package:uap_app/features/create_map/models/person_model.dart';

class ComplementListMap extends StatefulWidget {
  final List<PersonModel> listPerson;
  const ComplementListMap({required this.listPerson, super.key});

  @override
  State<ComplementListMap> createState() => _ComplementListMapState();
}

class _ComplementListMapState extends State<ComplementListMap> {

  final TextStyle _textStyle = TextStyle(
  color: AppColors.color3.color,
  fontWeight: FontWeight.bold,
  fontSize: 15,
  letterSpacing: 1,
);

  final List<Map<String, dynamic>> _allUsers = [
    {"id": 1, "name": "Andy", "age": 29},
    {"id": 2, "name": "Aragon", "age": 40},
    {"id": 3, "name": "Bob", "age": 5},
    {"id": 4, "name": "Barbara", "age": 35},
    {"id": 5, "name": "Candy", "age": 21},
    {"id": 6, "name": "Colin", "age": 55},
    {"id": 7, "name": "Audra", "age": 30},
    {"id": 8, "name": "Banana", "age": 14},
    {"id": 9, "name": "Caversky", "age": 100},
    {"id": 10, "name": "Becky", "age": 32},
  ];

  List<PersonModel> _foundUsers = [];

  @override
  void initState() {
    _foundUsers = widget.listPerson;
    super.initState();
  }

  void _runFilter(String enteredKeyword){
    List<PersonModel> results = [];
    if (enteredKeyword.isEmpty) {
      results = widget.listPerson;
    } else {
      results = widget.listPerson.where((element) => element.name.toLowerCase().contains(enteredKeyword.toLowerCase())).toList();
      inspect(results);
    }

    setState(() {
      _foundUsers = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text('Procure por um mapa', style: _textStyle,),
          ],
        ),
        const SizedBox(height: 5,),
        CustomTextField(
          onChange: (value) => _runFilter(value),
          hintText: 'Digite um nome', 
          focusedColor: AppColors.color3.color,
          
          ),
        
        Expanded(
          child: ListView.builder(
            itemCount: _foundUsers.length,
            itemBuilder: (context, index) => Card(
              key: ValueKey(_foundUsers[index].id),
              color: Colors.blue,
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: ListTile(
                leading: Text(
                  index.toString(),
                  style: const TextStyle(fontSize: 24, color: Colors.white),
                ),
                title: Text(
                  _foundUsers[index].name,
                  style: const TextStyle(color: Colors.white),
                ),
                subtitle: Text(
                  _foundUsers[index].data,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
