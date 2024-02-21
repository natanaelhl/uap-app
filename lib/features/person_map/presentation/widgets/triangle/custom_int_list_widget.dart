import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomIntListWidget extends StatefulWidget {
  final List<int> intList;
  final int index1;
  final int index2;
  final Function(String) onSelected;

  const CustomIntListWidget({
    Key? key,
    required this.onSelected,
    required this.intList,
    required this.index1,
    required this.index2,
  }) : super(key: key);

  @override
  State<CustomIntListWidget> createState() => _CustomIntListWidgetState();
}

class _CustomIntListWidgetState extends State<CustomIntListWidget> {
  @override
  Widget build(BuildContext context) {
    // Verifica se os índices estão dentro do intervalo da lista
    if (widget.index1 >= 0 &&
        widget.index1 < widget.intList.length &&
        widget.index2 >= 0 &&
        widget.index2 < widget.intList.length) {
      String concatenatedNumbers =
          '${widget.intList[widget.index1]}${widget.intList[widget.index2]}';

      
      setState(() {
        widget.onSelected(concatenatedNumbers);
      });
    }

    List<Widget> numberWidgets = [];
    for (int i = 0; i < widget.intList.length; i++) {
      numberWidgets.add(
        SizedBox(
          width: 20.0,
          child: Text(
            widget.intList[i].toString(),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: (i == widget.index1 || i == widget.index2)
                  ? Colors.blue
                  : null,
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
