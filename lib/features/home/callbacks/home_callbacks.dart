import 'package:flutter/material.dart';

class HomeCallbacks {
  final BuildContext context;
  const HomeCallbacks({required this.context});

  // Callback para navegação de feature;
  void navigateToFeature() {
    Navigator.pushNamed(context, '/personListView');
  }
}
