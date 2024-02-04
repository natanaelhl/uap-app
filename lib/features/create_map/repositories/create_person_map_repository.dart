import 'package:dartz/dartz.dart';
import 'package:uap_app/core/failure/failure.dart';
import 'package:uap_app/features/create_map/models/person_model.dart';
import 'package:uap_app/features/create_map/params/person_params.dart';

abstract class CreatePersonMapRepository {
  Future<Either<Failure, PersonModel>> createPersonMap(PersonParams params);
}
