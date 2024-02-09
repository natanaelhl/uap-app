import 'package:flutter/material.dart';
import 'package:uap_app/core/colors/app_colors.dart';

class CustomElevatedButton extends StatelessWidget {
  final void Function()? onPressed;
  final double? width;
  final double? height;
  final Color? color;
  final Widget child;
  const CustomElevatedButton({
    super.key,
    this.width,
    this.height,
    required this.onPressed,
    required this.color,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
          onPressed: onPressed,
          style: ButtonStyle(
              elevation: MaterialStateProperty.all(6),
              shadowColor: MaterialStateProperty.all(AppColors.color3.color),
              backgroundColor: MaterialStateProperty.all(color)),
          child: child),
    );
  }
}
