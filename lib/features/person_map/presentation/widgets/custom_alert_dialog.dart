import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uap_app/core/bloc/bloc_state.dart';
import 'package:uap_app/features/person_map/model/person_map_model.dart';
import 'package:uap_app/features/person_map/presentation/ui/custom_switch_case_widget.dart';
import 'package:uap_app/features/person_map/presentation/ui/custom_drop_down_button.dart';
import 'package:uap_app/features/person_map/triangle/triangle_widgettwo.dart';

class CustomAlertDialog extends StatefulWidget {
  final PersonMapModel personMap;
  final SharedPreferences prefs;
  final Stream<BlocState<dynamic>> state;
  const CustomAlertDialog(
      {required this.personMap,
      required this.prefs,
      required this.state,
      super.key});

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
              BuildContextTriangle(
                value: indexSelected,
                personMap: widget.personMap,
              ),
              StreamBuilder(
                  stream: widget.state,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text('Arcano: ${snapshot.data!.data}');
                    } else {
                      return Text('null');
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}
