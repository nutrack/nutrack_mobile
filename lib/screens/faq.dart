import 'package:nutrack_mobile/main.dart';
import 'package:flutter/material.dart';
import 'package:nutrack_mobile/provider/net_service.dart';
import 'package:provider/provider.dart';
import 'package:nutrack_mobile/widget/unauth_drawer.dart';
import 'package:nutrack_mobile/screens/login.dart';

class FaqPage extends StatefulWidget {
  const FaqPage({Key? key}) : super(key: key);
  static const ROUTE_NAME = '/home';
  @override
  State<FaqPage> createState() => _FaqState();
}

class _FaqState extends State<FaqPage> {
  @override
    Widget build(BuildContext context) => Scaffold(
        drawer: NutrackUnAuthDrawer(),
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: Text("FAQs"),
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