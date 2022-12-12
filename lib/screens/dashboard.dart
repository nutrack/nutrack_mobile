import 'package:nutrack_mobile/calorycalc/calorycalc.dart';
import 'package:nutrack_mobile/calorycalc/fetch/calc_fetch.dart';
import 'package:nutrack_mobile/calorycalc/history_page.dart';
import 'package:nutrack_mobile/main.dart';
import 'package:flutter/material.dart';
import 'package:nutrack_mobile/provider/net_service.dart';
import 'package:nutrack_mobile/screens/faq.dart';
import 'package:nutrack_mobile/screens/homepage.dart';
import 'package:provider/provider.dart';
import 'package:nutrack_mobile/widget/drawer_menu.dart';
import 'package:nutrack_mobile/screens/login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:nutrack_mobile/fetch/goal_fetch.dart';
import 'package:nutrack_mobile/model/calc_goal.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);
  static const routeName = '/nutrack';

  @override
  State<DashboardPage> createState() => _DashboardState();
}

class _DashboardState extends State<DashboardPage> {
  final _formKey = GlobalKey<FormState>();
  int goal = 0;
  
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final request = context.watch<NetworkService>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: NutrackDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Welcome, ${request.username}!'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              final response = await request.logoutAccount(
                  "https://nu-track.up.railway.app/logout-flutter/");
              if (response['status']) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Successfully logged out!"),
                ));
                Navigator.pushReplacementNamed(context, LoginPage.routeName);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("An error occured, please try again."),
                ));
              }
            },
          )
        ],
      ),
      body: Form(
        key: _formKey,
        child: Container(
            child: Column(children: [
          Text(
            "Today's Calories",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FutureBuilder(
                future: totalData(request),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Container(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                      child: Text(
                        "${snapshot.data} cal dari $goal cal",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    );
                  }
                  return const Center(child: CircularProgressIndicator());
                }),
          ),
          Container(
              width: width * 0.8,
              height: 70,
              child: Row(children: <Widget>[
                Expanded(
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const caloryAdd()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                        ),
                        child: Text(
                          "Add Calory",
                        ))),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const caloryHistory()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                        ),
                        child: Text(
                          "See Your Calories' History",
                          textAlign: TextAlign.center,
                        ))),
              ])),
          SizedBox(height: 10),
          Container(
            child: Column(
              children: <Widget>[
                Text(
                  "Set Your Calories Goal",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Set your today's goal",
                      hintText: "Example: 500",
                      contentPadding: EdgeInsets.all(8),
                    ),
                    onChanged: (String? value) {
                      // setState(() {
                      //   goal = int.parse(value!);
                      // });
                      if(value == null || value.isEmpty){

                      }else{
                        try {
                          setState(() {
                            goal = int.parse(value!);
                          });
                        }
                        on FormatException {       
                        }
                        catch(error) {
                              print(error);
                        }
                      }
                    },
                    onSaved: (String? value) {
                      // setState(() {
                      //   goal = int.parse(value!);
                      // });
                      if(value == null || value.isEmpty){

                      }else{
                        try {
                          setState(() {
                            goal = int.parse(value!);
                          });
                        }
                        on FormatException {       
                        }
                        catch(error) {
                              print(error);
                        }
                      }
                    },
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      final response = await request.postJson(
                          "https://nu-track.herokuapp.com/add_goal/",
                          convert.jsonEncode(<String, String>{
                            'goal': goal.toString(),
                          }));
                      if (response['status'] == 'success') {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Your goal has been set!"),
                        ));
                        Navigator.pushReplacementNamed(
                            context, DashboardPage.routeName);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("An error occured, please try again."),
                        ));
                      }
                    }
                  },
                  child: Text("Add"),
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              children: <Widget>[
                Card(
                  elevation: 4,
                  margin: const EdgeInsets.all(20),
                  child: InkWell(
                    onTap: () {},
                    splashColor: Colors.green,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(Icons.calculate, size: 50, color: Colors.orange),
                          Text(
                            "CaloryCalc",
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  elevation: 4,
                  margin: const EdgeInsets.all(20),
                  child: InkWell(
                    onTap: () {},
                    splashColor: Colors.green,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: const <Widget>[
                          Icon(Icons.restaurant, size: 50, color: Colors.red),
                          Text(
                            "Food Recommendation",
                            style: TextStyle(fontSize: 16),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  elevation: 4,
                  margin: const EdgeInsets.all(20),
                  child: InkWell(
                    onTap: () {},
                    splashColor: Colors.green,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: const <Widget>[
                          Icon(Icons.article, size: 50, color: Colors.yellow),
                          Text(
                            "Articles",
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  elevation: 4,
                  margin: const EdgeInsets.all(20),
                  child: InkWell(
                    onTap: () {},
                    splashColor: Colors.green,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: const <Widget>[
                          Icon(Icons.info, size: 50, color: Colors.blue),
                          Text(
                            "About Us",
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ])),
      ),
    );
  }
}
