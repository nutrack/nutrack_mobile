import 'dart:convert';

import 'package:flutter/material.dart';

List<FoodRecModel> foodRecModelFromJson(String str) => List<FoodRecModel>.from(
    json.decode(str).map((x) => FoodRecModel.fromJson(x)));

String foodRecModelToJson(List<FoodRecModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FoodRecModel {
  FoodRecModel({
    this.user,
    required this.name,
    required this.calories,
    required this.protein,
    required this.fat,
    required this.carbs,
    required this.isFood,
    required this.rating,
  });

  int? user;
  String name;
  int calories;
  int protein;
  int fat;
  int carbs;
  bool isFood;
  int rating;

  factory FoodRecModel.fromJson(Map<String, dynamic> json) => FoodRecModel(
        user: json["fields"]["user"],
        name: json["fields"]["name"],
        calories: json["fields"]["calories"],
        protein: json["fields"]["protein"],
        fat: json["fields"]["fat"],
        carbs: json["fields"]["carbs"],
        isFood: json["fields"]["is_food"],
        rating: json["fields"]["rating"],
      );

  Map<String, dynamic> toJson() => {
        "user": user,
        "name": name,
        "calories": calories,
        "protein": protein,
        "fat": fat,
        "carbs": carbs,
        "is_food": isFood,
        "rating": rating,
      };
}
