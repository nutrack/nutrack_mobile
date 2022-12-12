import 'package:flutter/material.dart';
import 'package:food_rec/screen/food_rec.dart';
import 'package:nutrack_mobile/screens/login.dart';
import 'package:nutrack_mobile/widget/drawer_menu.dart';
import 'package:nutrack_mobile/widget/unauth_drawer.dart';
import 'package:provider/provider.dart';
import 'package:nutrack_mobile/provider/net_service.dart';
import 'package:nutrack_mobile/screens/homepage.dart';
import 'package:nutrack_mobile/screens/register.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static final String title = 'Nutrack';

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) {
        NetworkService request = NetworkService();

        return request;
      },
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: title,
          theme: ThemeData(
            primarySwatch: Colors.deepOrange,
          ),
          home: MyHomePage(),
          onGenerateRoute: (RouteSettings settings) {
            switch (settings.name) {
              case MyHomePage.ROUTE_NAME:
                return MaterialPageRoute(builder: (_) => const MyHomePage());
              case LoginPage.ROUTE_NAME:
                return MaterialPageRoute(builder: (_) => const LoginPage());
              case RegisterPage.ROUTE_NAME:
                return MaterialPageRoute(builder: (_) => const RegisterPage());
              case FoodRec.ROUTE_NAME:
                return MaterialPageRoute(builder: (_) => const FoodRec());
              default:
                return MaterialPageRoute(
                  builder: (_) {
                    return const Scaffold(
                      body: Center(
                        child: Text('Page not found :('),
                      ),
                    );
                  },
                );
            }
          }),
    );
  }
}
