import 'package:flutter/material.dart';
import 'package:uap_app/core/colors/app_colors.dart';
import 'package:uap_app/core/widgets/custom_elevated_button_widget.dart';

class CustomAuthErrorAlertDialog extends StatelessWidget {
  final List data;
  const CustomAuthErrorAlertDialog({required this.data, super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Dados inválidos',
            style: TextStyle(
                letterSpacing: 3,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.color3.color),
          ),
          const Divider(
            thickness: 2,
          )
        ],
      ),
      content: SizedBox(
        width: MediaQuery.of(context).size.width * 0.33,
        child: Wrap(
          children: List.generate(
              data.length,
              (index) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 3),
                    child: Row(
                      children: [
                        const Text(
                          '* ',
                          style: TextStyle(color: Colors.red),
                        ),
                        Text(data[index])
                      ],
                    ),
                  )),
        ),
      ),
      actions: [
        CustomElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            color: AppColors.color6.color,
            width: double.infinity,
            height: 35,
            child: const Text(
              "Tentar novamente",
            ))
      ],
    );
  }
}
