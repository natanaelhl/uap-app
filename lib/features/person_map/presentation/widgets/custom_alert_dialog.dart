import 'package:flutter/material.dart';
import 'package:uap_app/features/person_map/controller/person_map_controller.dart';
import 'package:uap_app/features/person_map/model/person_map_model.dart';
import 'package:uap_app/features/person_map/presentation/complements/switch_case_complement.dart';
import 'package:uap_app/features/person_map/presentation/widgets/custom_drop_down_button.dart';

class CustomAlertDialog extends StatelessWidget {
  final PersonMapModel personMap;
  final PersonMapController controller;
  const CustomAlertDialog(
      {required this.personMap, required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: AlertDialog(
        title: const Text(
          'Escolha um triângulo',
        ),
        content: SizedBox(
          width: MediaQuery.of(context).size.width * 0.65,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomDropDownButton(
                controller: controller,
              ),
              const SizedBox(
                height: 30,
              ),
              SwitchCaseComplement(personMap: personMap, controller: controller)
            ],
          ),
        ),
      ),
    );
  }
}
