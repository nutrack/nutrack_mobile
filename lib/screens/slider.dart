import 'package:nutrack_mobile/main.dart';
import 'package:flutter/material.dart';
import 'package:nutrack_mobile/provider/net_service.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SliderPage extends StatelessWidget {
  final String title;
  final String description;
  final String image;
  SliderPage(
      {required this.title, required this.description, required this.image});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Nutrack's Features", 
            style: TextStyle(
              color: Colors.white,
              fontSize: 30, 
              fontWeight: FontWeight.bold)),
          SizedBox(height: 20),
          ClipRRect(
            borderRadius: BorderRadius.circular(20), 
            child: 
            Image.asset(
              image, 
              width: width * 0.85, 
              height: width * 0.65, 
              fit: BoxFit.cover
            ),
          ),
          SizedBox(height: 50),
          Text(
            title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80),
            child: Text(
              description,
              style: TextStyle(
                height: 1.5,
                fontSize: 16,
                fontWeight: FontWeight.normal,
                letterSpacing: 0.7,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 60),
        ],
      ),
    );
  }
}
