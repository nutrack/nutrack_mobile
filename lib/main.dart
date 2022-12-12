import 'package:flutter/material.dart';
import 'package:nutrack_mobile/screens/dashboard.dart';
import 'package:nutrack_mobile/screens/faq.dart';
import 'package:nutrack_mobile/screens/login.dart';
import 'package:nutrack_mobile/widget/drawer_menu.dart';
import 'package:nutrack_mobile/widget/unauth_drawer.dart';
import 'package:provider/provider.dart';
import 'package:nutrack_mobile/provider/net_service.dart';
import 'package:nutrack_mobile/screens/homepage.dart';
import 'package:nutrack_mobile/screens/register.dart';

void main() {
  Provider.debugCheckInvalidValueType = null;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static const primaryColor = Color(0xFF151026);
  static final String title = 'Nutrack';

  @override
  Widget build(BuildContext context) {
    var transparent;
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
          home: const MyHomePage(),
          onGenerateRoute: (RouteSettings settings) {
            switch (settings.name) {
              case MyHomePage.routeName:
                return MaterialPageRoute(builder: (_) => const MyHomePage());
              case LoginPage.routeName:
                return MaterialPageRoute(builder: (_) => const LoginPage());
              case RegisterPage.routeName:
                return MaterialPageRoute(builder: (_) => const RegisterPage());
              case DashboardPage.routeName:
                return MaterialPageRoute(builder: (_) => const DashboardPage());
              case FaqPage.routeName:
                return MaterialPageRoute(builder: (_) => const FaqPage());
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
