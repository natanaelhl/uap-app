import 'package:flutter/material.dart';

Widget customTextWidget(
  List<int> intList,
  BuildContext context,
) {
  // Convertendo a lista de inteiros para uma string, com espaço entre os números
  String inputString = intList.join(' ');

  List<String> patternsToHighlight = [
    '111',
    '222',
    '333',
    '444',
    '555',
    '666',
    '777',
    '888',
    '999'
  ];

  // Adapta os padrões para a expressão regular considerando espaços entre os dígitos
  String pattern = patternsToHighlight.map((e) => e.split('').join(' ')).join('|');
  RegExp regex = RegExp(pattern);

  List<Widget> widgets = [];
  int currentIndex = 0;

  for (Match match in regex.allMatches(inputString)) {
    // Adicione o texto antes do padrão
    widgets.add(Text(
      inputString.substring(currentIndex, match.start),
      style: const TextStyle(
        color: Colors.grey,
        letterSpacing: 3,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
    ));

    // Adicione o padrão destacado em vermelho
    widgets.add(Text(
      match.group(0)!,
      style: const TextStyle(
          letterSpacing: 3,
          fontSize: 18,
          color: Colors.red,
          fontWeight: FontWeight.w500),
    ));

    currentIndex = match.end;
  }

  // Adicione o texto restante após o último padrão
  widgets.add(Text(
    inputString.substring(currentIndex),
    style: const TextStyle(
      color: Colors.grey,
      fontSize: 18,
      letterSpacing: 3,
      fontWeight: FontWeight.w500,
    ),
  ));

  // Crie um widget que contém a lista de Texts criada
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: widgets,
  );
}
