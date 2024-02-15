import 'package:flutter/material.dart';
import 'package:uap_app/core/colors/app_colors.dart';
import 'package:uap_app/core/widgets/custom_elevated_button_widget.dart';
import 'package:uap_app/core/widgets/custom_text_field_widget.dart';
import 'package:uap_app/features/create_map/models/person_model.dart';

class CustomEditAlertDialog extends StatefulWidget {
  final PersonModel person;
  const CustomEditAlertDialog({required this.person, super.key});

  @override
  State<CustomEditAlertDialog> createState() => _CustomEditAlertDialogState();
}

class _CustomEditAlertDialogState extends State<CustomEditAlertDialog> {
  late TextEditingController nomeController;
  late TextEditingController dataController;

  @override
  void initState() {
    nomeController = TextEditingController(text: widget.person.name);
    dataController = TextEditingController(text: widget.person.data);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Edite as informações do mapa'),
          Divider(
            thickness: 2,
          ),
        ],
      ),
      content: SizedBox(
        width: MediaQuery.of(context).size.width * 0.33,
        child: SingleChildScrollView(
          child: ListBody(
            children: [
              const Text('Nome completo:'),
              const SizedBox(
                height: 5,
              ),
              CustomTextField(
                hintText: 'Nome Completo',
                focusedColor: AppColors.color3.color,
                controller: nomeController,
              ),
              const SizedBox(
                height: 15,
              ),
              const Text('Data de nascimento:'),
              const SizedBox(
                height: 5,
              ),
              CustomTextField(
                hintText: 'Nome Completo',
                focusedColor: AppColors.color3.color,
                controller: dataController,
              ),
            ],
          ),
        ),
      ),
      actions: [
        CustomElevatedButton(
            width: MediaQuery.of(context).size.width * 0.08,
            onPressed: () {
              Navigator.pop(
                  context,
                  PersonModel(
                      name: nomeController.text,
                      data: dataController.text,
                      id: widget.person.id));
            },
            color: AppColors.color3.color,
            child: const Text('Salvar')),
        CustomElevatedButton(
            width: MediaQuery.of(context).size.width * 0.08,
            onPressed: () {},
            color: AppColors.color3.color,
            child: const Text('Cancelar'))
      ],
    );
  }
}
