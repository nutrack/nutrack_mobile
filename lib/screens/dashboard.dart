import 'package:nutrack_mobile/main.dart';
import 'package:flutter/material.dart';
import 'package:nutrack_mobile/provider/net_service.dart';
import 'package:provider/provider.dart';
import 'package:nutrack_mobile/widget/drawer_menu.dart';
import 'package:nutrack_mobile/widget/unauth_drawer.dart';
import 'package:nutrack_mobile/screens/login.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  static const ROUTE_NAME = '/home';
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
    Widget build(BuildContext context) => Scaffold(
        drawer: NutrackDrawer(),
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: Text(MyApp.title),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.login), 
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },)
            ],
        ),
      );
}