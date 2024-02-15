import 'package:uap_app/features/create_map/models/person_model.dart';
import 'package:uap_app/features/create_map/repositories/edit_person_map_repository.dart';
import 'package:uap_app/features/create_map/usecases/edit_person_map_usecase.dart';

class EditPersonMapUsecaseImpl implements EditPersonMapUsecase {
  final EditPersonMapRepository repository;

  const EditPersonMapUsecaseImpl(this.repository);
  @override
  Future<String?> editPersonMap(PersonModel person) async {
    return await repository.editPersonMap(person);
  }
}
