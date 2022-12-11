library food_rec;

import 'dart:convert' as convert;
import 'dart:io';
import 'package:food_rec/model/food_rec_model.dart';
import 'package:food_rec/screen/add_food.dart';
import 'package:nutrack_mobile/main.dart';
import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:flutter/material.dart';
import 'package:nutrack_mobile/widget/drawer_menu.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:food_rec/util/fetch.dart';
// import cupertino icon
import 'package:flutter/cupertino.dart';
import 'package:food_rec/screen/food_detail.dart';
import 'package:food_rec/screen/add_food.dart';

class FoodRec extends StatefulWidget {
  static const ROUTE_NAME = "/food_rec";
  const FoodRec({super.key});

  @override
  State<FoodRec> createState() => _FoodRecState();
}

class LoggedIn {
  static Map<String, String> user_data = {};
  static var userLoggedIn = {};
}

class _FoodRecState extends State<FoodRec> {
  static const Color cardColor = Color.fromARGB(255, 250, 250, 217);
  static const Color buttonColor = Color.fromARGB(255, 255, 148, 23);
  static const Color ratingColor = Color.fromARGB(255, 238, 160, 43);
  static const Color iconColor = Color.fromARGB(255, 87, 110, 89);
  Future<List<FoodRecModel>> foodRecList = fetchFoodRec();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NutrackDrawer(),
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: Text("Food Recommendation"),
          centerTitle: true,
        ),
        // add dropdown button for sorting
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Add your onPressed code here!
            // go to add food page
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddFoodPage()),
            );
          },
          child: const Icon(Icons.add),
          backgroundColor: iconColor,
        ),
        // extendBodyBehindAppBar: true,
        // add dropdown button for sorting

        body: Container(
            child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FilterChip(
                label: Text('All'),
                onSelected: (isSelected) {
                  // Handle on selected
                  foodRecList = fetchFoodRec();
                  // refresh the future builder
                  setState(() {});
                },
              ),
              FilterChip(
                  label: Text('Food'),
                  onSelected: (isSelected) {
                    // Handle on selected
                    foodRecList = fetchFoodRecFood();
                    // refresh the future builder
                    setState(() {});
                  }),
              FilterChip(
                label: Text('Drink'),
                onSelected: (isSelected) {
                  // Handle on selected
                  foodRecList = fetchFoodRecDrink();
                  // refresh the future builder
                  setState(() {});
                },
              ),
            ],
          ),
          Expanded(
            child: FutureBuilder(
                future: foodRecList,
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.data == null) {
                    return const Center(
                        child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                                Color.fromARGB(209, 255, 164, 59))));
                  } else {
                    if (!snapshot.hasData) {
                      return Column(
                        children: const [
                          Text(
                            "Maaf, belum ada rekomendasi :(",
                            style: TextStyle(color: iconColor, fontSize: 20),
                          ),
                          SizedBox(height: 8),
                        ],
                      );
                    } else {
                      return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (_, index) => Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 12),
                                padding: const EdgeInsets.all(20.0),
                                decoration: BoxDecoration(
                                    color: cardColor,
                                    borderRadius: BorderRadius.circular(16.0),
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Color.fromARGB(40, 0, 0, 0),
                                          blurRadius: 2.0)
                                    ]),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    // add food icon, if is_food is true, if is_food is false, add drink icon
                                    // create column container

                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        if (snapshot.data![index].isFood ==
                                            true)
                                          const Icon(
                                            // add icon for food
                                            Icons.fastfood,
                                            color: iconColor,
                                            size: 32,
                                          )
                                        else
                                          const Icon(
                                            Icons.local_drink,
                                            color: iconColor,
                                            size: 30,
                                          ),
                                        Text(
                                          "${snapshot.data![index].name}",
                                          style: const TextStyle(
                                            fontSize: 30.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        // create a container for the rating and star icon
                                        Container(
                                          margin:
                                              const EdgeInsets.only(top: 10),
                                          child: Row(
                                            children: [
                                              // create a container for the rating

                                              // create a container for the star icon
                                              Container(
                                                // margin: const EdgeInsets.only(left: 10),
                                                child: const Icon(
                                                  Icons.star,
                                                  color: ratingColor,
                                                  size: 30,
                                                ),
                                              ),
                                              Container(
                                                padding:
                                                    const EdgeInsets.all(5),
                                                child: Text(
                                                  "${snapshot.data![index].rating}",
                                                  style: const TextStyle(
                                                    fontSize: 18.0,
                                                    fontWeight: FontWeight.bold,
                                                    color: ratingColor,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    // add button to see details
                                    Container(
                                      margin: const EdgeInsets.only(left: 20),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          // Add your onPressed code here!
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    FoodRecDetail(
                                                        foodRec: snapshot
                                                            .data![index])),
                                          );
                                        },
                                        child: const Text('See Details'),
                                        style: ElevatedButton.styleFrom(
                                          primary: buttonColor,
                                          onPrimary: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                // add button to see details
                              ));
                    }
                  }
                }),
          )
        ])));
  }
}
