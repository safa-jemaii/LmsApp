import 'package:flutter/material.dart';
import 'package:frontend/services/api_service.dart';
import 'package:frontend/services/api_service.dart';
import 'models/Courses.dart';


class EditDataWidget extends StatefulWidget {
  const EditDataWidget({Key? key, required this.events}) : super(key: key);

  final Events events;
  @override
  State<EditDataWidget> createState() => _EditDataWidgetState();
}

class _EditDataWidgetState extends State<EditDataWidget> {
  final ApiService api = ApiService();
  final _addFormKey = GlobalKey<FormState>();
  String id = '';
  final _nameController = TextEditingController();
  final _locationController = TextEditingController();
  final _imageUrlController = TextEditingController();
  final _dateController = TextEditingController();
  final _monthController = TextEditingController();
  @override
  void initState() {
    id = widget.events.id;
    _nameController.text = widget.events.name;
    _locationController.text = widget.events.description;
    _imageUrlController.text = widget.events.fichier;
    _dateController.text = widget.events.duree;
    // _monthController.text = widget.events.month;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Casessssssssssss'),
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
                                  hintText: ' Name',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter  name';
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
                                controller: _locationController ,
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
                                    return 'Please enter duree';
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
                        //           hintText: 'Country',
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
                                    api.updateCases(id, Events(name: _nameController.text, description:_locationController.text, fichier: _imageUrlController.text, duree: _dateController.text,  updated: DateTime.now().toString(), id: '')).whenComplete(() => Navigator.of(context).pushNamedAndRemoveUntil('/', ModalRoute.withName('/')));



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