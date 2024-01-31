import 'package:flutter/material.dart';

class CustomIntListWidget extends StatelessWidget {
  final List<int> intList;
  final int index1;
  final int index2;

  const CustomIntListWidget({
    Key? key,
    required this.intList,
    required this.index1,
    required this.index2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Verifica se os índices estão dentro do intervalo da lista
    if (index1 >= 0 && index1 < intList.length && index2 >= 0 && index2 < intList.length) {
      String concatenatedNumbers = '${intList[index1]}${intList[index2]}';
      print(concatenatedNumbers); // Imprime os números concatenados
    }

    List<Widget> numberWidgets = [];
    for (int i = 0; i < intList.length; i++) {
      numberWidgets.add(
        SizedBox(
          width: 20.0,
          child: Text(
            intList[i].toString(),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: (i == index1 || i == index2) ? Colors.blue : null,
            ),
          ),
        ),
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: numberWidgets,
    );
  }
}
