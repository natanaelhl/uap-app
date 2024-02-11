import 'package:flutter/material.dart';
import 'package:uap_app/features/create_map/models/person_model.dart';
import 'package:uap_app/features/create_map/params/person_params.dart';
import 'package:uap_app/features/create_map/usecases/create_person_map_usecase.dart';
import 'package:uap_app/features/create_map/usecases/get_person_list_usecase.dart';

class CreateMapController {
  final BuildContext context;
  final CreatePersonMapUsecase usecase;
  final GetPersonListUsecase getPersonListUsecase;

  CreateMapController(this.usecase, this.getPersonListUsecase, this.context);

  final ValueNotifier<List<PersonModel>> listPeople =
      ValueNotifier<List<PersonModel>>([]);

  Future createPersonMap(PersonParams params) async {
    var result = await usecase.createPersonMap(params);

    result.fold((l) => print('deu erro'), (r) {
      Navigator.of(context).pushNamed('/personMapView', arguments: r);
    });
  }

  Future<void> getPersonList() async {
    var result = await getPersonListUsecase.getListPerson();

    result.fold((l) => null, (r) {
      listPeople.value = r;
    });
  }
}
