import 'package:flutter/material.dart';
import 'package:uap_app/features/person_map/presentation/widgets/custom_alert_dialog.dart';

class PersonMapController {
  
  showCustomDialog (BuildContext context) {
    return showDialog(
      context: context, 
      builder: (context) => CustomAlertDialog()
    );
  }
}