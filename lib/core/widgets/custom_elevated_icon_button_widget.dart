import 'package:flutter/material.dart';

class CustomElevatedIconButtonWidget extends StatelessWidget {
  final Color color;
  final Widget icon;
  final Widget label;
  final void Function()? onPressed;
  const CustomElevatedIconButtonWidget({
    super.key,
    required this.color,
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: ElevatedButton.icon(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(color),
          ),
          onPressed: onPressed,
          icon: icon,
          label: label),
    );
  }
}
