import 'package:flutter/material.dart';
import 'package:uap_app/core/drawer/callbacks/custom_drawer_callbaks.dart';
import 'package:uap_app/core/drawer/controller/custom_drawer_controller.dart';
import 'package:uap_app/core/drawer/repository/logout_repository_impl.dart';
import 'package:uap_app/core/drawer/usecases/logout_usecase_impl.dart';
import 'package:uap_app/core/drawer/widget/build_custom_drawer.dart';
import 'package:uap_app/core/services/auth_service.dart';

class CustomDrawerWidget extends StatefulWidget {
  final BuildContext context;
  const CustomDrawerWidget({super.key, required this.context});

  @override
  State<CustomDrawerWidget> createState() => _CustomDrawerWidgetState();
}

class _CustomDrawerWidgetState extends State<CustomDrawerWidget> {
  late final CustomDrawerCallback _callback;
  late final CustomDrawerController _controller;

  @override
  void initState() {
    super.initState();
    _callback = CustomDrawerCallback(context: context);
    _controller = CustomDrawerController(
        SignOutUsecaseImpl(SignOutRepositoryImpl(AuthService())),
        onSucess: () => _callback.navigatorToPage(),
        onError: () => _callback.showDialog());
  }

  @override
  Widget build(BuildContext context) {
    return buildCustomDrawer(_controller);
  }
}
