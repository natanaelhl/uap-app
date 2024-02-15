import 'package:uap_app/features/create_map/models/person_model.dart';

abstract class EditPersonMapUsecase {
  Future<String?> editPersonMap(PersonModel model);
}
