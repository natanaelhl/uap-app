import 'package:flutter/material.dart';
import 'package:uap_app/core/utils/numerologia.dart';
import 'package:uap_app/features/person_map/presentation/widgets/custom_drop_down_button.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {

    Map arcano = Numerologia.calcularNumerologia('123456', '1999-26-08');

    return AlertDialog(
      title: const Text('Escolha um triângulo',),
      content: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          CustomDropDownButton(),
          Text('1234567890')
        ],),
      ),
      );
  }
}