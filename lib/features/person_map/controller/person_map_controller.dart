import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:uap_app/core/utils/numerologia.dart';
import 'package:uap_app/features/person_map/model/person_map_model.dart';
import 'package:uap_app/features/person_map/presentation/widgets/custom_alert_dialog.dart';

class PersonMapController {
  

  PersonMapModel getMapArcane(String fullName, String numberList, String dataNasc) {

    Map result = Numerologia.calcularNumerologia(fullName, numberList, dataNasc);

    PersonMapModel personMap = PersonMapModel(
      name: result['name'], 
      arcanoAtual: result['arcanoAtual'], 
      listNumbers: result['list_numbers'],
      faseAtual: result['faseAtual'], 
      indiceResultante1: result['indiceResultante1'], 
      indiceResultante2: result['indiceResultante2'], 
      trianglelist: result['triangle_list']);
    
    return personMap;
  }

  showCustomDialog (BuildContext context, PersonMapModel personMap) {
    return showDialog(
      context: context, 
      builder: (context) => CustomAlertDialog(personMap: personMap,)
    );
  }
}