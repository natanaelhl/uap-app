import 'package:uap_app/features/create_map/models/person_model.dart';

abstract class EditPersonMapRepository {
  Future<String?> editPersonMap(PersonModel person);
}
