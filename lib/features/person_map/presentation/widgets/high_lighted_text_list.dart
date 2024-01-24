import 'package:flutter/material.dart';

class HighlightedTextList extends StatelessWidget {
  final List<int> listNumbers;
  final int indice1;
  final int indice2;
  final double? fontSize;

  const HighlightedTextList({
    required this.listNumbers, 
    required this.indice1, 
    required this.indice2, 
    this.fontSize = 18.0, 
    super.key});

  @override
  Widget build(BuildContext context) {
    List<InlineSpan> spans = [];

    for (int i = 0; i < listNumbers.length; i++) {
      if (i == indice1) {
        // Concatena os números destacados em uma string
        String highlightedNumbers = listNumbers.sublist(indice1, indice2 + 1).join(' ');
        spans.add(
          TextSpan(
            text: highlightedNumbers,
            style: TextStyle(
              color: Colors.blue,
              decoration: TextDecoration.underline,
              fontSize: fontSize,
            ),
          ),
        );
        i = indice2; // Pula para o índice após o indice2
      } else {
        spans.add(
          TextSpan(
            text: '${listNumbers[i]}', 
            style: TextStyle(fontSize: fontSize)));

      }

      // Adiciona um espaço após cada número, incluindo o número destacado
      if (i < listNumbers.length - 1) {
        spans.add(const TextSpan(text: ' '));
      }
    }

    return Row(
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
