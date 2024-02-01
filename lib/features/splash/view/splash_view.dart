import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:uap_app/core/services/auth_service.dart';
import 'package:uap_app/features/splash/callbacks/splash_callbacks.dart';
import 'package:uap_app/features/splash/controller/splash_controller.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  late SplashController _controller;

  @override
  void initState() {
    super.initState();

    _controller =
        SplashController(AuthService(), SplashCallbacks(context: context));
    _controller.handleAuthentication();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildSplashBody(),
    );
  }

  Widget buildSplashBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Center(child: Lottie.asset('assets/loading_lottie.json'))],
    );
  }
}
