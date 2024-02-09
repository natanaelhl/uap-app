import 'package:flutter/material.dart';
import 'package:uap_app/core/colors/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  final String? hintText;
  final bool? obscureText;
  final IconData? icon;
  final Widget? suffixIcon;
  final TextEditingController controller;
  const CustomTextFormField(
      {super.key,
      required this.controller,
      this.icon,
      this.suffixIcon,
      this.hintText,
      this.obscureText});

  @override
  Widget build(BuildContext context) {
    print('chegou aqui XX');
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: AppColors.color1.color,
          boxShadow: [
            BoxShadow(
                color: AppColors.color3.color.withOpacity(0.5),
                spreadRadius: 0,
                blurRadius: 1,
                offset: const Offset(2, 2))
          ]),
      child: TextField(
          cursorColor: AppColors.color3.color,
          controller: controller,
          obscureText: obscureText!,
          decoration: InputDecoration(
              prefixIcon: icon != null
                  ? Icon(
                      icon,
                      color: Colors.grey,
                    )
                  : null,
              suffixIcon: suffixIcon,
              hintText: hintText,
              border: const OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: AppColors.color3.color, width: 2)))),
    );
  }
}
