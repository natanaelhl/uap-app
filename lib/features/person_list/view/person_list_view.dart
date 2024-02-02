import 'package:flutter/material.dart';
import 'package:uap_app/core/drawer/widget/build_custom_drawer.dart';
import 'package:uap_app/core/drawer/widget/custom_drawer_widget.dart';

class PersonListView extends StatefulWidget {
  const PersonListView({super.key});

  @override
  State<PersonListView> createState() => _PersonListViewState();
}

class _PersonListViewState extends State<PersonListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        drawer: CustomDrawerWidget(
          context: context,
        ));
  }
}
