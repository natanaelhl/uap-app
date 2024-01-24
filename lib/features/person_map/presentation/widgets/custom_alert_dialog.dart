import 'package:flutter/material.dart';
import 'package:uap_app/features/person_map/presentation/widgets/custom_drop_down_button.dart';
import 'package:uap_app/features/person_map/presentation/widgets/high_lighted_text_list.dart';

class CustomAlertDialog extends StatelessWidget {
  final Map personArcane;
  const CustomAlertDialog({required this.personArcane, super.key});

  @override
  Widget build(BuildContext context) {

    return AlertDialog(
      title: const Text('Escolha um triângulo',),
      content: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          const CustomDropDownButton(),
          HighlightedTextList(listNumbers: personArcane['listNumbers'], indice1: personArcane['indiceResultante'], indice2: personArcane['indiceResultante'] + 1)
        ],),
      ),
      );
  }
}