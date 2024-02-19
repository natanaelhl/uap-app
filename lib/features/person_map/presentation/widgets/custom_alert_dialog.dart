import 'package:flutter/material.dart';
import 'package:uap_app/features/person_map/model/person_map_model.dart';
import 'package:uap_app/features/person_map/presentation/widgets/custom_switch_case_widget.dart';
import 'package:uap_app/features/person_map/presentation/widgets/custom_drop_down_button.dart';

class CustomAlertDialog extends StatefulWidget {
  final PersonMapModel personMap;
  const CustomAlertDialog({required this.personMap, super.key});

  @override
  State<CustomAlertDialog> createState() => _CustomAlertDialogState();
}

class _CustomAlertDialogState extends State<CustomAlertDialog> {
  int indexSelected = 0;
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
                onSelected: (selectValue) {
                  setState(() {
                    indexSelected = selectValue;
                  });
                },
              ),
              const SizedBox(
                height: 30,
              ),
              buildContent(indexSelected, widget.personMap)
            ],
          ),
        ),
      ),
    );
  }
}
