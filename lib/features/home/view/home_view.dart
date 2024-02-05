import 'package:flutter/material.dart';
import 'package:uap_app/core/drawer/widget/custom_drawer_widget.dart';
import 'package:uap_app/core/widgets/custom_app_bar_widget.dart';
import 'package:uap_app/features/home/callbacks/home_callbacks.dart';
import 'package:uap_app/features/home/controller/home_controller.dart';
import 'package:uap_app/features/home/view/build_home_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final HomeCallbacks _callbacks;
  late final HomeController _controller;

  @override
  void initState() {
    super.initState();
    _callbacks = HomeCallbacks(context: context);
    _controller = HomeController(
      onNavigate: () => _callbacks.navigateToFeature(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarWidget(
        title: Text('Home'),
      ),
      drawer: CustomDrawerWidget(context: context),
      body: buildHomeView(context, _controller),
    );
  }
}
