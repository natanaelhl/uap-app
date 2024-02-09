import 'package:flutter/material.dart';

mixin class HudMixins {
  void navigateRemoveUntil(BuildContext context, String routeName) {
    Navigator.of(context).pushNamedAndRemoveUntil(routeName, (route) => false);
  }
}
