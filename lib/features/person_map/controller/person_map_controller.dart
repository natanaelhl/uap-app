import 'package:flutter/material.dart';
import 'package:uap_app/core/utils/numerologia.dart';
import 'package:uap_app/features/person_map/model/person_map_model.dart';

class PersonMapController {
  final ValueNotifier<int> selectedIndex = ValueNotifier<int>(0);

  PersonMapModel getMapArcane(
      String fullName, String numberList, String dataNasc) {
    Map result =
        Numerologia.calcularNumerologia(fullName, numberList, dataNasc);

    PersonMapModel personMap = PersonMapModel(
        name: result['name'],
        arcanoAtual: result['arcanoAtual'],
        listNumbers: result['list_numbers'],
        faseAtual: result['faseAtual'],
        indiceResultante1: result['indiceResultante1'],
        indiceResultante2: result['indiceResultante2'],
        trianglelist: result['triangle_list'],
        dataNasc: result['data_nasc']);

    return personMap;
  }

  // showCustomDialog (BuildContext context, PersonMapModel personMap) {

  // }

  changeDropdownTriangle(int index) {
    selectedIndex.value = index;
  }
}
