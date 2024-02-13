import 'dart:developer';

import 'package:uap_app/core/bloc/bloc.dart';
import 'package:uap_app/core/bloc/bloc_event.dart';
import 'package:uap_app/core/bloc/bloc_state.dart';
import 'package:uap_app/features/create_map/bloc/create_map_event.dart';
import 'package:uap_app/features/create_map/models/person_model.dart';
import 'package:uap_app/features/create_map/usecases/get_person_list_usecase.dart';

class CreateMapBloc extends Bloc {
  final GetPersonListUsecase getPeopleListUsecase;
  late List<PersonModel> listPerson;

  CreateMapBloc(this.getPeopleListUsecase){
    listPerson = [];
  }

  @override
  mapListenEvent(BlocEvent event) {
    if (event is CreateMapEventGetPeopleList){
      _handleGetPeopleList();

    }
  }
  
  _handleGetPeopleList() async{
   var result = await getPeopleListUsecase.getListPerson();
   result.fold((l) => null, (r){
    listPerson = r;
    dispatchState(BlocStableState(data: listPerson));
   });
  }

}