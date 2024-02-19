import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:uap_app/core/colors/app_colors.dart';
import 'package:uap_app/core/widgets/custom_app_bar_widget.dart';
import 'package:uap_app/core/widgets/custom_elevated_button_widget.dart';
import 'package:uap_app/features/create_map/models/person_model.dart';
import 'package:uap_app/features/person_map/presentation/bloc/person_map_bloc.dart';
import 'package:uap_app/features/person_map/presentation/bloc/person_map_event.dart';

class PersonMapView extends StatefulWidget {
  final PersonModel person;
  const PersonMapView({required this.person, super.key});

  @override
  State<PersonMapView> createState() => _PersonMapViewState();
}

class _PersonMapViewState extends State<PersonMapView> {
  late PersonMapBloc _bloc;

  @override
  void initState() {
    _bloc = GetIt.I.get();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(
        title: Text(widget.person.name),
      ),
      body: Column(
        children: [
          CustomElevatedButton(
              onPressed: () {
                _bloc.dispatchEvent(PersonMapEventShowAlertDialog(
                    context: context, person: widget.person));
              },
              color: AppColors.color5.color,
              child: const Text('Abrir Triângulo')),
        ],
      ),
    );
  }
}
