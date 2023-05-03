import 'package:flutter/material.dart';
import 'package:frontend/main.dart';
import 'package:frontend/services/api_service.dart';

import 'models/Courses.dart';




class AddDataWidget extends StatefulWidget {
  const AddDataWidget({Key? key}) : super(key: key);

  @override
  State<AddDataWidget> createState() => _AddDataWidgetState();
}

class _AddDataWidgetState extends State<AddDataWidget> {
  _AddDataWidgetState();

  final ApiService api = ApiService();
  final _addFormKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _locationController = TextEditingController();
  final _imageUrlController = TextEditingController();
  final _dateController = TextEditingController();
  final _monthController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Eventkkkkkk'),
      ),
      body: Form(
        key: _addFormKey,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Card(
                child: Container(
                    padding: const EdgeInsets.all(10.0),
                    width: 440,
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              const Text(' Name'),
                              TextFormField(
                                controller: _nameController,
                                decoration: const InputDecoration(
                                  hintText: 'Name',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter name of cours';
                                  }
                                  return null;
                                },
                                onChanged: (value) {},
                              ),
                            ],
                          ),
                        ),

                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              const Text('description'),
                              TextFormField(
                                controller: _locationController,
                                decoration: const InputDecoration(
                                  hintText: 'description',
                                ),
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter description';
                                  }
                                  return null;
                                },
                                onChanged: (value) {},
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              const Text('fichier'),
                              TextFormField(
                                controller: _imageUrlController,
                                decoration: const InputDecoration(
                                  hintText: 'fichier',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter fichier';
                                  }
                                  return null;
                                },
                                onChanged: (value) {},
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              const Text('duree'),
                              TextFormField(
                                controller: _dateController,
                                decoration: const InputDecoration(
                                  hintText: 'duree',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter date';
                                  }
                                  return null;
                                },
                                onChanged: (value) {},
                              ),
                            ],
                          ),
                        ),
                        // Container(
                        //   margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                        //   child: Column(
                        //     children: <Widget>[
                        //       const Text('month'),
                        //       TextFormField(
                        //         controller: _monthController,
                        //         decoration: const InputDecoration(
                        //           hintText: 'month',
                        //         ),
                        //         validator: (value) {
                        //           if (value!.isEmpty) {
                        //             return 'Please enter month';
                        //           }
                        //           return null;
                        //         },
                        //         onChanged: (value) {},
                        //       ),
                        //     ],
                        //   ),
                        // ),

                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              ElevatedButton(
                                onPressed: () {
                                  if (_addFormKey.currentState!.validate()) {
                                    _addFormKey.currentState!.save();
                                    api.createCase(Events(name: _nameController.text,  description: _locationController.text, fichier: _imageUrlController.text, duree: _dateController.text,  updated: DateTime.now().toString()));

                                    //Navigator.pop(context,(){setState(() {});});
                                    Navigator.of(context).pushNamedAndRemoveUntil('/', ModalRoute.withName('/'));

                                  }
                                },
                                child: const Text('Save', style: TextStyle(color: Colors.white)),
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                )
            ),
          ),
        ),
      ),
    );
  }
}