import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:uap_app/core/utils/numerology_converter.dart';
import 'package:uap_app/features/person_map/controller/person_map_controller.dart';
import 'package:uap_app/features/person_map/model/person_map_model.dart';

class PersonMapView extends StatefulWidget {
  const PersonMapView({super.key});

  @override
  State<PersonMapView> createState() => _PersonMapViewState();
}

class _PersonMapViewState extends State<PersonMapView> {

  final PersonMapController _controller = PersonMapController();

  late PersonMapModel personMap;

  final String numberList = NumerologyConverter.convertNameToNumbers('natanael hausmano lacerda');
  
  final String dataNasc = '1999-08-26';

  final String fullName = 'natanael hausmano lacerda'; 

  @override
  void initState() {
    personMap = _controller.getMapArcane(fullName, numberList, dataNasc);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () => _controller.showCustomDialog(context, personMap), 
          child: const Text('Abrir Triângulo'),)
        ],
      ),
    );
  }
}