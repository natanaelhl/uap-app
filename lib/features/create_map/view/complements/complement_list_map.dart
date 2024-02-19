import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:uap_app/core/colors/app_colors.dart';
import 'package:uap_app/core/widgets/custom_text_field_widget.dart';
import 'package:uap_app/features/create_map/bloc/create_map_bloc.dart';
import 'package:uap_app/features/create_map/bloc/create_map_event.dart';
import 'package:uap_app/features/create_map/models/person_model.dart';
import 'package:uap_app/features/person_map/presentation/ui/person_map_view.dart';

class ComplementListMap extends StatefulWidget {
  final CreateMapBloc bloc;
  final List<PersonModel> listPerson;
  const ComplementListMap(
      {required this.listPerson, required this.bloc, super.key});

  @override
  State<ComplementListMap> createState() => _ComplementListMapState();
}

class _ComplementListMapState extends State<ComplementListMap> {
  final TextStyle _textStyle = TextStyle(
    color: AppColors.color3.color,
    fontWeight: FontWeight.bold,
    fontSize: 15,
    letterSpacing: 1,
  );

  List<PersonModel> _foundUsers = [];

  @override
  void initState() {
    _foundUsers = widget.listPerson;
    super.initState();
  }

  void _runFilter(String enteredKeyword) {
    List<PersonModel> results = [];
    if (enteredKeyword.isEmpty) {
      results = widget.listPerson;
    } else {
      results = widget.listPerson
          .where((element) =>
              element.name.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      inspect(results);
    }

    setState(() {
      _foundUsers = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'Procure por um mapa',
              style: _textStyle,
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        CustomTextField(
          onChange: (value) => _runFilter(value),
          hintText: 'Digite um nome',
          focusedColor: AppColors.color3.color,
        ),
        const SizedBox(
          height: 20,
        ),
        Expanded(
          child: widget.bloc.listPerson.isEmpty
              ? Container(
                  width: double.infinity,
                  color: AppColors.color4.color,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text('Lista vazia')],
                  ),
                )
              : ListView.builder(
                  itemCount: _foundUsers.length,
                  itemBuilder: (context, index) => Card(
                    key: ValueKey(_foundUsers[index].id),
                    color: AppColors.color4.color,
                    elevation: 4,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  PersonMapView(person: _foundUsers[index]))),
                      child: ListTile(
                        leading: IconButton(
                            onPressed: () {
                              widget.bloc.dispatchEvent(
                                  CreateMapEventShowAlertDialog(
                                      context: context,
                                      person: _foundUsers[index]));
                            },
                            icon: const Icon(Icons.edit)),
                        title: Text(
                          _foundUsers[index].name,
                          style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 94, 93, 93)),
                        ),
                        subtitle: Text(
                          _foundUsers[index].data,
                          style:
                              const TextStyle(fontSize: 15, color: Colors.grey),
                        ),
                        trailing: IconButton(
                            onPressed: () {
                              widget.bloc.dispatchEvent(
                                  CreateMapEventDeletePerson(
                                      id: _foundUsers[index].id));
                            },
                            icon: const Icon(Icons.delete)),
                      ),
                    ),
                  ),
                ),
        ),
      ],
    );
  }
}
