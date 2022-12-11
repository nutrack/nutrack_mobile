import 'package:http/http.dart' as http;
import 'package:food_rec/model/food_rec_model.dart';
import 'dart:convert';

Future<List<FoodRecModel>> fetchFoodRec() async {
  var url = Uri.parse('https://nu-track.up.railway.app/food_rec/json/');
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      'Content-Type': 'application/json',
    },
  );

  // decode response to json
  var data = json.decode(response.body);

  // convert json to list of food rec model
  List<FoodRecModel> foodRecModel = [];
  for (var i in data) {
    if (i != null) {
      foodRecModel.add(FoodRecModel.fromJson(i));
      // print(foodRecModel.length);
    }
  }

  // print food rec model

  return foodRecModel;
}

Future<List<FoodRecModel>> fetchFoodRecFood() async {
  var url = Uri.parse('https://nu-track.up.railway.app/food_rec/json/');
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      'Content-Type': 'application/json',
    },
  );

  // decode response to json
  var data = json.decode(response.body);

  // convert json to list of food rec model
  List<FoodRecModel> foodRecModel = [];
  for (var i in data) {
    if (i != null) {
      if (i["fields"]["is_food"] == true) {
        foodRecModel.add(FoodRecModel.fromJson(i));
      }
      // print(foodRecModel.length);
    }
  }

  // print food rec model

  return foodRecModel;
}

Future<List<FoodRecModel>> fetchFoodRecDrink() async {
  var url = Uri.parse('https://nu-track.up.railway.app/food_rec/json/');
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      'Content-Type': 'application/json',
    },
  );

  // decode response to json
  var data = json.decode(response.body);

  // convert json to list of food rec model
  List<FoodRecModel> foodRecModel = [];
  for (var i in data) {
    if (i != null) {
      if (i["fields"]["is_food"] == false) {
        foodRecModel.add(FoodRecModel.fromJson(i));
      }
      // print(foodRecModel.length);
    }
  }

  // print food rec model

  return foodRecModel;
}
