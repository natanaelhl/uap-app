import 'package:flutter/material.dart';

class CustomIntMatrixWidget extends StatelessWidget {
  final List<List<int>> matrix;

  const CustomIntMatrixWidget({
    Key? key,
    required this.matrix,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> rowWidgets = [];
    List<String> patterns = []; // Lista para armazenar os padrões identificados

    for (var intList in matrix) {
      List<Widget> numberWidgets = [];
      String line = intList.join();

      // Verifica padrões de três números iguais em sequência
      RegExp exp = RegExp(r'(\d)\1{2}');
      Iterable<RegExpMatch> matches = exp.allMatches(line);

      // Cria um conjunto para armazenar índices de números destacados
      Set<int> highlightedIndices = {};
      for (var match in matches) {
        patterns.add(match.group(0)!); // Adiciona o padrão identificado à lista
        for (int i = match.start; i < match.end; i++) {
          highlightedIndices.add(i);
        }
      }

      // Constrói widgets de texto para cada número
      for (int i = 0; i < line.length; i++) {
        numberWidgets.add(
          SizedBox(
            width: 20.0,
            child: Center(
              child: Text(
                line[i],
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: highlightedIndices.contains(i) ? Colors.red : null),
              ),
            ),
          ),
        );
      }

      rowWidgets.add(Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: numberWidgets,
      ));
    }

    print('sequencias = $patterns'); // Imprime os padrões identificados

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: rowWidgets,
    );
  }
}
