import 'package:flutter/material.dart';

class HomeController {
  final VoidCallback onNavigate;
  const HomeController({required this.onNavigate});

  handleNavigateFeature() {
    print('chegou aqui');
    onNavigate();
  }
}
