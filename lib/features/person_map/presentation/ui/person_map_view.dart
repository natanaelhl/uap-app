import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:uap_app/core/colors/app_colors.dart';
import 'package:uap_app/core/widgets/custom_app_bar_widget.dart';
import 'package:uap_app/core/widgets/custom_elevated_button_widget.dart';
import 'package:uap_app/features/create_map/models/person_model.dart';
import 'package:uap_app/features/person_map/presentation/bloc/person_map_bloc.dart';
import 'package:uap_app/features/person_map/presentation/bloc/person_map_event.dart';
import 'package:uap_app/features/person_map/presentation/ui/custom_drop_down_button.dart';
import 'package:uap_app/features/person_map/presentation/ui/custom_switch_case_widget.dart';

class PersonMapView extends StatefulWidget {
  final PersonModel person;
  const PersonMapView({required this.person, super.key});

  @override
  State<PersonMapView> createState() => _PersonMapViewState();
}

class _PersonMapViewState extends State<PersonMapView> {
  late PersonMapBloc _bloc;

  ValueNotifier<int> indexValue = ValueNotifier<int>(0);

  @override
  void initState() {
    _bloc = GetIt.I.get();

    _bloc.dispatchEvent(PersonMapEventOnReady(person: widget.person));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(
        title: Text(widget.person.name),
      ),
      body: StreamBuilder(
          stream: _bloc.state,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  CustomElevatedButton(
                      onPressed: () {
                        _bloc.dispatchEvent(PersonMapEventShowAlertDialog(
                            person: widget.person,
                            context: context,
                            customAlertDialog: AlertDialog(
                              title: const Text('Escolha um triangulo'),
                              content: SingleChildScrollView(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 30),
                                  child: Column(
                                    children: [
                                      CustomDropDownButton(onSelected: (value) {
                                        setState(() {
                                          indexValue.value = value;
                                        });
                                      }),
                                      ValueListenableBuilder<int>(
                                        valueListenable: indexValue,
                                        builder: (_, value, __) {
                                          return BuildContextTriangle(
                                            value: value,
                                            personMap: snapshot.data!.data,
                                          );
                                        }
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )));
                      },
                      color: AppColors.color5.color,
                      child: const Text('Abrir Triângulo')),
                ],
              );
            } else {
              return const SizedBox.shrink();
            }
          }),
    );
  }
}
