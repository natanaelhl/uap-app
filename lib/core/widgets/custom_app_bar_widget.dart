import 'package:flutter/material.dart';
import 'package:uap_app/core/colors/app_colors.dart';

class CustomAppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  final Widget title;
  const CustomAppBarWidget({super.key, required this.title});

  @override
  State<CustomAppBarWidget> createState() => _CustomAppBarWidgetState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomAppBarWidgetState extends State<CustomAppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: widget.title,
      backgroundColor: AppColors.color3.color,
    );
  }
}
