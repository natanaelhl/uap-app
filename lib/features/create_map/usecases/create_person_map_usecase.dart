import 'package:dartz/dartz.dart';
import 'package:uap_app/core/failure/failure.dart';
import 'package:uap_app/core/utils/params.dart';
import 'package:uap_app/features/create_map/models/person_model.dart';

abstract class CreatePersonMapUsecase {
  Future<Either<Failure, PersonModel>> createPersonMap(PersonParams params);
}
