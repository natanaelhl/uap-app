import 'package:flutter/material.dart';
import 'package:uap_app/core/colors/app_colors.dart';

class CustomElevatedButton extends StatelessWidget {
  final void Function()? onPressed;
  final Widget child;
  const CustomElevatedButton({
    super.key,
    required this.onPressed,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(AppColors.color3.color)),
        child: child);
  }
}
