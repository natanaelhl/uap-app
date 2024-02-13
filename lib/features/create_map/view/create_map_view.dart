import 'package:flutter/material.dart';
import 'package:uap_app/core/bloc/bloc_state.dart';
import 'package:uap_app/core/drawer/widget/custom_drawer_widget.dart';
import 'package:uap_app/core/services/auth_service.dart';
import 'package:uap_app/core/services/database_service.dart';
import 'package:uap_app/core/widgets/custom_app_bar_widget.dart';
import 'package:uap_app/features/create_map/bloc/create_map_bloc.dart';
import 'package:uap_app/features/create_map/bloc/create_map_event.dart';
import 'package:uap_app/features/create_map/controller/create_map_controller.dart';
import 'package:uap_app/features/create_map/repositories/create_person_map_repository_impl.dart';
import 'package:uap_app/features/create_map/repositories/get_person_list_repository_impl.dart';
import 'package:uap_app/features/create_map/usecases/create_person_map_usecase_impl.dart';
import 'package:uap_app/features/create_map/usecases/get_person_list_usecase_impl.dart';
import 'package:uap_app/features/create_map/view/build_create_map_view.dart';

class CreateMapView extends StatefulWidget {
  const CreateMapView({super.key});

  @override
  State<CreateMapView> createState() => _CreateMapViewState();
}

class _CreateMapViewState extends State<CreateMapView> {
  late CreateMapBloc _bloc;
  late CreateMapController _controller;

  @override
  void initState() {
    super.initState();
    _controller = CreateMapController(
      CreatePersonMapUsecaseImpl(CreatePersonMapRepositoryImpl(
        AuthService(),
        DatabaseService(),
      )),
      GetPersonListUsecaseImpl(
          GetPersonListRepositoryImpl(AuthService(), DatabaseService())),
      context,
    );

     _bloc = CreateMapBloc(GetPersonListUsecaseImpl(GetPersonListRepositoryImpl(AuthService(), DatabaseService())));
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
        builder: (context, snapshot){
          if (snapshot.hasData) {
            if (snapshot.data is BlocStableState){
              return buildCreateMapView(_controller, _bloc, snapshot.data!.data);
            } return SizedBox.shrink();
          } else{
            return SizedBox.shrink();
          }
        }),
    );
  }
}
