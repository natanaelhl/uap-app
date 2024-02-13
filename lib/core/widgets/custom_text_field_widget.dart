import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final Color focusedColor;
  final Color? cursorColor;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? controller;
  final void Function(String)? onChange;
  const CustomTextField(
      {super.key,
      required this.hintText,
      required this.focusedColor,
      this.onChange,
      this.controller,
      this.inputFormatters,
      this.cursorColor});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChange,
      controller: controller,
      inputFormatters: inputFormatters,
      cursorColor: cursorColor,
      decoration: InputDecoration(
          hintText: hintText,
          border: const OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: focusedColor, width: 2.0))),
    );
  }
}
