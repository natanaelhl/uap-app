import 'package:uap_app/core/services/auth_service.dart';
import 'package:uap_app/core/services/database_service.dart';
import 'package:uap_app/features/create_map/models/person_model.dart';
import 'package:uap_app/features/create_map/repositories/edit_person_map_repository.dart';

class EditPersonMapRepositoryImpl implements EditPersonMapRepository {
  final DatabaseService dbService;
  final AuthService authService;

  const EditPersonMapRepositoryImpl(this.authService, this.dbService);
  @override
  Future<String?> editPersonMap(PersonModel person) async {
    try {
      await dbService.instance
          .collection('users')
          .doc(authService.instance.currentUser!.uid)
          .collection('people')
          .doc(person.id)
          .update(toMap(person));

      return null;
    } on Exception catch (e) {
      return e.toString();
    }
  }
}
