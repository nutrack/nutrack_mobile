import 'package:flutter/material.dart';
import 'package:nutrack_mobile/calorycalc/fetch/calc_fetch.dart';
import 'package:nutrack_mobile/calorycalc/history_page.dart';
import 'package:nutrack_mobile/screens/login.dart';
import 'package:nutrack_mobile/widget/drawer_menu.dart';
import 'package:nutrack_mobile/widget/unauth_drawer.dart';
import 'package:provider/provider.dart';
import 'package:nutrack_mobile/provider/net_service.dart';
import 'package:nutrack_mobile/screens/homepage.dart';
import 'package:nutrack_mobile/screens/register.dart';

import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';

import 'dart:convert' as convert;



class caloryAdd extends StatefulWidget{
  const caloryAdd({super.key});
  @override
  State<caloryAdd> createState()=>_caloryAdd();
}

class _caloryAdd extends State<caloryAdd>{
  final _formKey = GlobalKey<FormState>();
  int calory=0;
  int totalcalory=0;

   void addArticleToJson(request) async {
    var data = convert.jsonEncode(<String, dynamic>{
      'calory':calory,
    });

    final response = await request.postJson(
        'https://nu-track.up.railway.app/calorycalc/add_calory_flutter/', data);

    if (response['status'] == 'success') {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Calory has been added!"),
      ));
    } 
    
    else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("An error occured, please try again."),
      ));
    }
  }



 Widget build(BuildContext context) {
    // The rest of your widgets are down below
    final request = context.watch<NetworkService>();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: NutrackUnAuthDrawer(),
      appBar: AppBar(
        title: const Text("Submit"),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body:
      Form(
        key:_formKey,
        child: SingleChildScrollView(
          child:Column(
            children:[
              Container(
                padding:const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child:Text(
                  "Your total calory today are: $totalcalory",
                  ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child:TextFormField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(90.0),
                        borderSide: const BorderSide(
                          color: Colors.green,
                          width: 1.0,
                        ),
                      ),
                       focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(90.0),
                        borderSide: const BorderSide(
                          color: Colors.green,
                          width: 1.0,
                        ),
                      ),
                      labelText: 'Input Calory yang didapatkan',
                  ),
                  onChanged: (String? value){
                    setState(() {
                      calory=int.parse(value!);
                    });},
                  onSaved: (String? value){
                    setState(() {
                      calory=int.parse(value!);
                    });
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                      if (value!.isEmpty) {
                        return "Calory Tidak Boleh Kosong";
                      }
                      return null;
                    },
                ),
              ),
              Container(
                    height: 80,
                    padding: const EdgeInsets.all(20),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(50),
                        backgroundColor: Colors.green,
                      ),
                      child: const Text('Submit'),
                      onPressed: () async {
                        if(_formKey.currentState!.validate()){
                          totalcalory+=calory;
                          addArticleToJson(request);
                        }
                      },
                    )
                    ),
                    TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const caloryHistory()));
                  },
                  child: Text(
                    'Check your history',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ),
            ]
          )
        ),
        ),
      );
 }
}