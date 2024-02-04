import 'dart:developer';

import 'package:uap_app/features/create_map/params/person_params.dart';
import 'package:uap_app/features/create_map/usecases/create_person_map_usecase.dart';

class CreateMapController {
  final CreatePersonMapUsecase usecase;

  const CreateMapController(this.usecase);

  Future createPersonMap(PersonParams params) async {
    var result = await usecase.createPersonMap(params);

    result.fold((l) => print('deu erro'), (r) => inspect(r));
  }
}
