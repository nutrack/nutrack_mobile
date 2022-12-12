import 'dart:convert' as convert;
import 'package:nutrack_mobile/provider/net_service.dart';
import 'package:flutter/material.dart';
import 'package:nutrack_mobile/widget/drawer_menu.dart';
import 'package:provider/provider.dart';

class TestimonyForm extends StatefulWidget {
  const TestimonyForm({super.key});
  static const routeName = '/create-testimony';

  @override
  State<TestimonyForm> createState() => _TestimonyFormState();
}

class _TestimonyFormState extends State<TestimonyForm> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _testimonyController = TextEditingController();
  String _title = "";
  String _testimony = "";

  @override
  Widget build(BuildContext context) {
    final request = context.watch<NetworkService>();

    return Scaffold(
      appBar: AppBar(title: const Text('Create Testimony')),
      drawer: const NutrackDrawer(),
      body: Form(
        key: _formKey,
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onChanged: (String? value) {
                  setState(() {
                    _title = value!;
                  });
                },
                onSaved: (String? value) {
                  _title = value!;
                },
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Title can\'t be blank!';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _testimonyController,
                decoration: InputDecoration(
                  labelText: 'Testimony',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onChanged: (String? value) {
                  setState(() {
                    _testimony = value!;
                  });
                },
                onSaved: (String? value) {
                  _testimony = value!;
                },
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Testimony can\'t be blank!';
                  }
                  return null;
                },
              ),
              const Spacer(),
              Center(
                child: SizedBox(
                  width: 100,
                  height: 50,
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.deepOrange),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        final response = await request.postJson(
                            'https://nu-track.up.railway.app/testimonies/create-testimonies-flutter',
                            convert.jsonEncode(<String, String>{
                              'title': _title,
                              'testimony': _testimony
                            }));
                        if (response['status'] == 'success') {
                          _testimonyController.clear();
                          _titleController.clear();
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text(
                                "Thank you. Your testimony has been added!"),
                          ));
                        } else {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text("An error occured, please try again."),
                          ));
                        }
                      }
                    },
                    child: const Text(
                      'Create',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
