import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:uap_app/core/utils/numerology_converter.dart';
import 'package:uap_app/core/widgets/custom_app_bar_widget.dart';
import 'package:uap_app/features/create_map/models/person_model.dart';
import 'package:uap_app/features/person_map/controller/person_map_controller.dart';
import 'package:uap_app/features/person_map/model/person_map_model.dart';
import 'package:uap_app/features/person_map/presentation/widgets/custom_alert_dialog.dart';

class PersonMapView extends StatefulWidget {
  const PersonMapView({super.key});

  @override
  State<PersonMapView> createState() => _PersonMapViewState();
}

class _PersonMapViewState extends State<PersonMapView> {
  final PersonMapController _controller = PersonMapController();

  late PersonMapModel personMap;

  final String numberList =
      NumerologyConverter.convertNameToNumbers('natanael hausmano lacerda');

  final String dataNasc = '1999-08-26';

  final String fullName = 'natanael hausmano lacerda';

  @override
  void initState() {
    personMap = _controller.getMapArcane(fullName, numberList, dataNasc);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    var arguments = ModalRoute.of(context)!.settings.arguments as PersonModel;
    inspect(arguments);
    return Scaffold(
      appBar: CustomAppBarWidget(
        title: Text(arguments.name),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () => showDialog(
                context: context,
                builder: (context) => CustomAlertDialog(
                      personMap: personMap,
                      controller: _controller,
                    )),
            child: const Text('Abrir Triângulo'),
          )
        ],
      ),
    );
  }
}
