import 'package:flutter/material.dart';
import 'package:uap_app/core/utils/numerologia.dart';
import 'package:uap_app/features/person_map/presentation/widgets/custom_alert_dialog.dart';

class PersonMapController {
  

  getMapArcane(String numberList, String dataNasc) {
    return Numerologia.calcularNumerologia(numberList, dataNasc);
  }

  showCustomDialog (BuildContext context, Map personArcane) {
    return showDialog(
      context: context, 
      builder: (context) => CustomAlertDialog(personArcane: personArcane,)
    );
  }
}