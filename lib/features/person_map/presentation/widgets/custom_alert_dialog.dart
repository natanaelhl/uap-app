import 'package:flutter/material.dart';
import 'package:uap_app/features/person_map/model/person_map_model.dart';
import 'package:uap_app/features/person_map/presentation/widgets/int_list_display.dart';
import 'package:uap_app/features/person_map/presentation/widgets/custom_drop_down_button.dart';
import 'package:uap_app/features/person_map/presentation/widgets/high_lighted_text_list.dart';

class CustomAlertDialog extends StatelessWidget {
  final PersonMapModel personMap;
  const CustomAlertDialog({required this.personMap, super.key});

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: AlertDialog(
        title: const Text('Escolha um triângulo',),
        content: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            const CustomDropDownButton(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(personMap.name, 
                style: const TextStyle(
                  fontSize: 15.6, 
                  fontWeight: FontWeight.w500),
                  ),
              ],
            ),
            HighlightedTextList(
              personMap: personMap,
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: personMap.trianglelist.length,
              itemBuilder: (context, index) => customTextWidget(personMap.trianglelist[index], context))
              
          ],),
        ),
        ),
    );
  }
}