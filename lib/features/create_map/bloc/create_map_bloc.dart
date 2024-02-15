import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:uap_app/core/bloc/bloc.dart';
import 'package:uap_app/core/bloc/bloc_event.dart';
import 'package:uap_app/core/bloc/bloc_state.dart';
import 'package:uap_app/core/utils/params.dart';
import 'package:uap_app/features/create_map/bloc/create_map_event.dart';
import 'package:uap_app/features/create_map/models/person_model.dart';
import 'package:uap_app/features/create_map/usecases/create_person_map_usecase.dart';
import 'package:uap_app/features/create_map/usecases/delete_person_map_usecase.dart';
import 'package:uap_app/features/create_map/usecases/edit_person_map_usecase.dart';
import 'package:uap_app/features/create_map/usecases/get_person_list_usecase.dart';

class CreateMapBloc extends Bloc {
  final GetPersonListUsecase getPeopleListUsecase;
  final CreatePersonMapUsecase createPersonMapUsecase;
  final DeletePersonMapUsecase deletePersonMapUsecase;
  final EditPersonMapUsecase editPersonMapUsecase;
  late List<PersonModel> listPerson;

  CreateMapBloc(
    this.getPeopleListUsecase,
    this.createPersonMapUsecase,
    this.deletePersonMapUsecase,
    this.editPersonMapUsecase,
  ) {
    listPerson = [];
  }

  @override
  mapListenEvent(BlocEvent event) {
    if (event is CreateMapEventGetPeopleList) {
      _handleGetPeopleList();
    } else if (event is CreateMapEventCreatePerson) {
      _handleCreatePerson(event.params);
    } else if (event is CreateMapEventDeletePerson) {
      _hangleDeletePerson(event.id);
    } else if (event is CreateMapEventShowAlertDialog) {
      _handleEditPerson(event.context, event.person);
    }
  }

  _handleEditPerson(BuildContext context, PersonModel person) async {
    print('chegou aqui');
    await showEditContact(context, person).then((value) async {
      var result = await editPersonMapUsecase.editPersonMap(value);
      if (result == null) {
        int index = listPerson.indexOf(person);
        listPerson[index] = value;
        dispatchState(BlocStableState(data: listPerson));
      } else {
        inspect(result);
        print('qualquer coisa');
      }
    });
  }

  Future _hangleDeletePerson(String id) async {
    var result = await deletePersonMapUsecase.deletePersonMap(id);

    result.fold((l) => print('erro ao deletar contato'), (r) {
      listPerson.removeWhere((element) => element.id == id);
      dispatchState(BlocStableState(data: listPerson));
    });
  }

  _handleCreatePerson(PersonParams params) async {
    var result = await createPersonMapUsecase.createPersonMap(params);

    result.fold((l) => print('deu erro'), (r) {
      listPerson.add(r);

      dispatchState(BlocStableState(data: listPerson));
    });
  }

  _handleGetPeopleList() async {
    var result = await getPeopleListUsecase.getListPerson();
    result.fold((l) => null, (r) {
      listPerson = r;
      dispatchState(BlocStableState(data: listPerson));
    });
  }
}
