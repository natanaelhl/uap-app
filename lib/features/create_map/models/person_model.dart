class PersonModel {
  final String name;
  final String data;
  final String id;

  const PersonModel({required this.name, required this.data, required this.id});

  factory PersonModel.fromJson(dynamic map) {
    return PersonModel(name: map['name'], data: map['data'], id: map['id']);
  }
}

toMap(PersonModel model) {
  return {'name': model.name, 'data': model.data, 'id': model.id};
}
