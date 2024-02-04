import 'package:flutter/material.dart';
import 'package:uap_app/core/drawer/widget/custom_drawer_widget.dart';
import 'package:uap_app/core/widgets/custom_app_bar_widget.dart';
import 'package:uap_app/features/person_list/view/build_list_view.dart';

class PersonListView extends StatefulWidget {
  const PersonListView({super.key});

  @override
  State<PersonListView> createState() => _PersonListViewState();
}

class _PersonListViewState extends State<PersonListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarWidget(),
      drawer: CustomDrawerWidget(
        context: context,
      ),
      body: buildPersonListView(),
    );
  }
}
