import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:uap_app/core/colors/app_colors.dart';
import 'package:uap_app/core/widgets/custom_elevated_icon_button_widget.dart';
import 'package:uap_app/core/widgets/custom_text_field_widget.dart';
import 'package:uap_app/features/create_map/controller/create_map_controller.dart';
import 'package:uap_app/features/create_map/params/person_params.dart';

final TextStyle textStyle = TextStyle(
  color: AppColors.color3.color,
  fontWeight: FontWeight.bold,
  fontSize: 15,
  letterSpacing: 1,
);

class ComplementFormMap extends StatelessWidget {
  final CreateMapController controller;
  ComplementFormMap({super.key, required this.controller});

  final MaskTextInputFormatter _maskTextInputFormatter =
      MaskTextInputFormatter(mask: '##/##/####');

  final TextEditingController nameController = TextEditingController();
  final TextEditingController dataController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Nome completo', style: textStyle),
        const SizedBox(
          height: 5,
        ),
        CustomTextField(
          controller: nameController,
          hintText: 'Digite o nome do paciente',
          focusedColor: AppColors.color3.color,
          cursorColor: AppColors.color3.color,
        ),
        const SizedBox(
          height: 18,
        ),
        Text(
          'Data de nascimento',
          style: textStyle,
        ),
        const SizedBox(
          height: 5,
        ),
        CustomTextField(
          controller: dataController,
          hintText: 'Data de nascimento',
          focusedColor: AppColors.color3.color,
          cursorColor: AppColors.color3.color,
          inputFormatters: [_maskTextInputFormatter],
        ),
        const SizedBox(
          height: 25,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: SizedBox(
                  child: CustomElevatedIconButtonWidget(
                onPressed: () async {
                  final result = await controller.createPersonMap(PersonParams(
                      name: nameController.text, data: dataController.text));

                  inspect(result);
                },
                label: const Text('Criar Mapa'),
                color: AppColors.color3.color,
                icon: const Icon(
                  Icons.create_outlined,
                ),
              )),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.04,
            ),
            Expanded(
                child: CustomElevatedIconButtonWidget(
              onPressed: () {
                nameController.clear();
                dataController.clear();
              },
              color: AppColors.color5.color,
              icon: const Icon(Icons.restore_from_trash),
              label: const Text('Apagar'),
            )),
          ],
        )
      ],
    );
  }
}
