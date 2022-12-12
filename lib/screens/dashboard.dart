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
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 310,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.green,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      begin: Alignment.bottomRight,
                      colors: [
                        Colors.black.withOpacity(.4),
                        Colors.black.withOpacity(.2),
                      ],
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Today's Calories",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: Text(""),
                      ),
                      // FutureBuilder buat get data
                      // FutureBuilder(
                      //     future: fetchGoal(),
                      //     builder: (context, AsyncSnapshot snapshot) {
                      //       if (snapshot.data == null) {
                      //         if (snapshot.hasError) {
                      //           return Text("${snapshot.error}");
                      //         }
                      //         return const Center(
                      //             child: CircularProgressIndicator());
                      //       } else {
                      //         if (!snapshot.hasData) {
                      //           return Column(children: const [
                      //             Text(
                      //               "dari 0 cal",
                      //               style: TextStyle(
                      //                 color: Colors.white,
                      //                 fontSize: 16,
                      //               ),
                      //             ),
                      //           ]);
                      //         } else {
                      //           return Column(children: const [
                      //             Text(
                      //               "dari ${snapshot.data![index].fields.title} cal",
                      //               style: TextStyle(
                      //                 color: Colors.white,
                      //                 fontSize: 16,
                      //               ),
                      //             ),
                      //           ]);
                      //         }
                      //       }
                      // });
                      Text(
                        "$goal cal dari $goal cal",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      Container(
                          width: width * 0.8,
                          height: 70,
                          child: Row(children: <Widget>[
                            Expanded(
                                child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.orange,
                                    ),
                                    child: Text(
                                      "Add Calory",
                                      style: TextStyle(color: Colors.white),
                                    ))),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                                child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.orange,
                                    ),
                                    child: Text(
                                      "See Your Calories' History",
                                      textAlign: TextAlign.center,
                                    ))),
                          ])),
                      SizedBox(height: 10),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            Text(
                              "Set Your Calories Goal",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 16),
                              child: TextField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: "Set your today's goal",
                                  hintText: "Example: 500",
                                  contentPadding: EdgeInsets.all(8),
                                ),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () async {
                                final response = await request.postJson(
                                    "https://nu-track.herokuapp.com/add_goal/",
                                    convert.jsonEncode(<String, String>{
                                      'goal': goal.toString(),
                                    }));
                                if (response['status'] == 'success') {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                    content: Text("Your goal has been set!"),
                                  ));
                                  Navigator.pushReplacementNamed(
                                      context, DashboardPage.routeName);
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                    content: Text(
                                        "An error occured, please try again."),
                                  ));
                                }
                              },
                              child: Text("Add"),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children: <Widget>[
                    Card(
                      elevation: 4,
                      margin: const EdgeInsets.all(18),
                      child: InkWell(
                        onTap: () {},
                        splashColor: Colors.green,
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Icon(Icons.calculate,
                                  size: 50, color: Colors.orange),
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
                      margin: const EdgeInsets.all(18),
                      child: InkWell(
                        onTap: () {},
                        splashColor: Colors.green,
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: const <Widget>[
                              Icon(Icons.restaurant,
                                  size: 50, color: Colors.red),
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
                      margin: const EdgeInsets.all(18),
                      child: InkWell(
                        onTap: () {},
                        splashColor: Colors.green,
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: const <Widget>[
                              Icon(Icons.article,
                                  size: 50, color: Colors.yellow),
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
                      margin: const EdgeInsets.all(18),
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
            ],
          ),
        ),
      ),
    );
  }
}
