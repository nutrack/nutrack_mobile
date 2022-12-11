import 'package:nutrack_mobile/main.dart';
import 'package:flutter/material.dart';
import 'package:nutrack_mobile/screens/homepage.dart';
import 'package:nutrack_mobile/screens/register.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:nutrack_mobile/widget/unauth_drawer.dart';
import 'dart:convert';
import 'package:nutrack_mobile/provider/net_service.dart';
import 'package:nutrack_mobile/screens/register.dart';
import 'package:nutrack_mobile/provider/auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  static const ROUTE_NAME = '/login';

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _loginFormKey = GlobalKey<FormState>();
  bool isPasswordVisible = false;
  void togglePasswordView() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  String username = "";
  String password1 = "";
  @override
  Widget build(BuildContext context) {
    // The rest of your widgets are down below
    final request = context.watch<NetworkService>();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: NutrackUnAuthDrawer(),
      appBar: AppBar(
        title: const Text("Login"),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: Form(
          key: _loginFormKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: Image.asset(
                    'assets/images/ic_launcher.png',
                    height: 75,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: Text(
                    "Login Form",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
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
                      labelText: 'Username',
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        username = value!;
                      });
                    },
                    onSaved: (String? value) {
                      setState(() {
                        username = value!;
                      });
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Username can't be empty";
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.password),
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
                      labelText: 'Password',
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        password1 = value!;
                      });
                    },
                    onSaved: (String? value) {
                      setState(() {
                        password1 = value!;
                      });
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Password can't be empty";
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
                      child: const Text('Log In'),
                      onPressed: () async {
                        final response = await request
                            .login("https://nu-track.up.railway.app/login-flutter/", {
                          'username': username,
                          'password': password1,
                        });
                        if (response['status']) {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            content: Text("Successfully logged in!"),
                          ));

                          Navigator.pushReplacementNamed(context,
                              MyHomePage.ROUTE_NAME);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            content: Text("An error occured, please try again."),
                          ));
                        }
                      },
                    )),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, RegisterPage.ROUTE_NAME);
                  },
                  child: Text(
                    'Create New Account Here!',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ),
              ],
            )
          ),
      ),
    );
  }
}
