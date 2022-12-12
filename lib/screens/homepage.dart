import 'package:nutrack_mobile/main.dart';
import 'package:flutter/material.dart';
import 'package:nutrack_mobile/provider/net_service.dart';
import 'package:nutrack_mobile/screens/faq.dart';
import 'package:nutrack_mobile/widget/drawer_menu.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:nutrack_mobile/widget/unauth_drawer.dart';
import 'package:nutrack_mobile/screens/login.dart';
import 'package:nutrack_mobile/screens/slider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  static const routeName = '/home';

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController _controller = PageController();
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: NutrackUnAuthDrawer(),
        appBar: AppBar(
          backgroundColor: Colors.orange,
          elevation: 0.0,
          actions: [
            IconButton(
              icon: Icon(Icons.login),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
            )
          ],
        ),
        body: Container(
          child: Stack(
            children: [
              PageView(
                onPageChanged: (index) {
                  setState(() {
                    onLastPage = (index == 2);
                  });
                },
                controller: _controller,
                children: [
                  Container(
                        
                      color: Colors.deepOrange,
                      child: SliderPage(
                        title: "CaloryCalc",
                        description: "How many calories have you consumed today?",
                        image: 'assets/images/using_calculator.png',
                      ),
                  ),
                  Container(
                      color: Colors.deepOrange,
                      child: SliderPage(
                        title: "Food Recommendation",
                        description: "Are these foods into your liking?",
                        image: 'assets/images/cereal.jpg',
                      ),
                  ),
                  Container(
                      color: Colors.deepOrange,
                      child: SliderPage(
                        title: "Article",
                        description: "Up to date with the latest information on nutrition",
                        image: 'assets/images/read.jpg',
                      ),
                  ),
                ],
              ),
              Container(
                alignment: Alignment(0, 0.85),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    onLastPage
                    ? GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, LoginPage.routeName);
                        },
                        child: Text(
                          "Login", 
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            )),
                        )
                    : GestureDetector(
                        onTap: () {
                          _controller.jumpToPage(2);
                        },
                        child: Text(
                          "Skip", 
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          ))
                        ),
                    SmoothPageIndicator(controller: _controller, count: 3),
                    GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, FaqPage.routeName);
                        },
                        child: Text(
                          "Help", 
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            )
                        ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
