import 'package:flutter/material.dart';
import 'package:nutrack_mobile/widget/unauth_drawer.dart';
import 'package:nutrack_mobile/widget/drawer_menu.dart';
import 'package:nutrack_mobile/main.dart';


class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});
  static const routeName = '/about-us';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
      ),
      drawer: MyApp.loggedIn ? const NutrackDrawer() : const NutrackUnAuthDrawer(),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: const [
          Text(
            'Nutrack helps you to take care your nutrition needs',
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          SizedBox(height:14),
          Text(
            'It is important to keep a healthy diet, especially in this COVID-19 situation. With healthy diet, you can have strong immunity. Nutrack is here to help you track your nutrition.',
            style: TextStyle(
              fontSize: 14,
            ),
          ),
          SizedBox(height: 10,),
          Text(
            "Sometimes, we can get bored by same food we eat everyday. Here at Nutrack you can find various healthy dishes you can try so you won't be bored by foods again.",
            style: TextStyle(
              fontSize: 14,
            ),
          ),
          SizedBox(height: 14,),
          Text(
            'What can you do with Nutrack?',
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          SizedBox(height:14),
          Text(
            '\u2022    Count and update your daily calories'
          ),
          SizedBox(height: 10,),
          Text(
            '\u2022    Write an article about your healthy diet and share it to people'
          ),
          SizedBox(height: 10,),
          Text(
            '\u2022    Find various healthy foods and drinks that you can try'
          ),
        ],
      ),
    );
  }
}
