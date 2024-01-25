import 'package:flutter/material.dart';
import 'package:uap_app/features/person_map/model/person_map_model.dart';

class HighlightedTextList extends StatelessWidget {
  final PersonMapModel personMap;
  final double? fontSize;

  const HighlightedTextList({
    required this.personMap,
    this.fontSize = 18.0, 
    super.key});

  @override
  Widget build(BuildContext context) {
    List<InlineSpan> spans = [];

    for (int i = 0; i < personMap.listNumbers.length; i++) {
      if (i == personMap.indiceResultante1) {
        // Concatena os números destacados em uma string
        String highlightedNumbers = personMap.listNumbers.sublist(personMap.indiceResultante1, personMap.indiceResultante2 + 1).join('  ');
        spans.add(
          TextSpan(
            text: highlightedNumbers,
            style: TextStyle(
              color: Colors.blue,
              decoration: TextDecoration.underline,
              fontSize: fontSize,
              fontWeight: FontWeight.w500
            ),
          ),
        );
        i = personMap.indiceResultante2; // Pula para o índice após o indice2
      } else {
        spans.add(
          TextSpan(
            text: '${personMap.listNumbers[i]}', 
            style: TextStyle(
              color: Colors.grey,
              fontSize: fontSize, 
              fontWeight: FontWeight.w500)));

      }

      // Adiciona um espaço após cada número, incluindo o número destacado
      if (i < personMap.listNumbers.length - 1) {
        spans.add(const TextSpan(text: '   '));
      }
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RichText(
          text: TextSpan(
            style: DefaultTextStyle.of(context).style,
            children: spans,
          ),
        ),
      ],
    );
  }
}
