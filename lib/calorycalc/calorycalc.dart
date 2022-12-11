import 'package:flutter/material.dart';
import 'package:nutrack_mobile/provider/nav_provider.dart';
import 'package:nutrack_mobile/widget/drawer_menu.dart';
import 'package:provider/provider.dart';

class caloryAdd extends StatefulWidget{
  const caloryAdd({super.key});
  @override
  State<caloryAdd> createState()=>_caloryAdd();
}

class _caloryAdd extends State<caloryAdd>{
@override
    Widget build(BuildContext context) => Scaffold(
        drawer: NutrackDrawer(),
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: Text("CaloryCalc"),
          centerTitle: true,
        ),
      );
}