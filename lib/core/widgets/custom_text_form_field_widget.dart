import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final bool? obscureText;
  final TextEditingController controller;
  const CustomTextFormField(
      {super.key, required this.controller, this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        obscureText: obscureText!,
        decoration: const InputDecoration(border: OutlineInputBorder()));
  }
}
