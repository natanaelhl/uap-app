import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:uap_app/core/bloc/bloc_state.dart';
import 'package:uap_app/core/drawer/widget/custom_drawer_widget.dart';
import 'package:uap_app/core/widgets/custom_app_bar_widget.dart';
import 'package:uap_app/features/create_map/bloc/create_map_bloc.dart';
import 'package:uap_app/features/create_map/bloc/create_map_event.dart';
import 'package:uap_app/features/create_map/view/build_create_map_view.dart';

class CreateMapView extends StatefulWidget {
  const CreateMapView({super.key});

  @override
  State<CreateMapView> createState() => _CreateMapViewState();
}

class _CreateMapViewState extends State<CreateMapView> {
  late CreateMapBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = GetIt.I.get();
    _bloc.dispatchEvent(CreateMapEventGetPeopleList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarWidget(
        title: Text('Crie Mapas'),
      ),
      drawer: CustomDrawerWidget(
        context: context,
      ),
      body: StreamBuilder(
          stream: _bloc.state,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data is BlocStableState) {
                return buildCreateMapView(_bloc, snapshot.data!.data);
              }
              return const SizedBox.shrink();
            } else {
              return const SizedBox.shrink();
            }
          }),
    );
  }
}
