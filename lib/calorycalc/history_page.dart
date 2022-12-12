import 'package:flutter/material.dart';
import 'package:nutrack_mobile/calorycalc/fetch/calc_fetch.dart';
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



class caloryHistory extends StatefulWidget{
  const caloryHistory({super.key});
  @override
  State<caloryHistory> createState()=>_caloryHistory();
}

class _caloryHistory extends State<caloryHistory>{
  final _formKey = GlobalKey<FormState>();

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
      body:FutureBuilder(
        future: fetchCalc(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData) {
              return Column(
                children: const <Widget>[
                  Text(
                    "Tidak ada to do list :(",
                    style: TextStyle(
                      color: Color(0xff59A5D8),
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 8)
                ],
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 2.0,
                      )
                    ]
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        snapshot.data![index].date.toString(),
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text("${snapshot.data![index].calory.toString()}")
                    ],
                  ),
                ),
              );
            }
          }
        },
      ),
      );
 }
}