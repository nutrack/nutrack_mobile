import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/calc_goal.dart';

Future<List<NutrackGoal>> fetchGoal() async {
  var url = Uri.parse('https://nu-track.up.railway.app/goal-json/');

  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );

  // melakukan decode response menjadi bentuk json
  var data = jsonDecode(utf8.decode(response.bodyBytes));

  // melakukan konversi data json menjadi object ToDo

  List<NutrackGoal> listGoal = [];
  for (var d in data) {
    // print(d);
    if (d != null) {
      listGoal.add(NutrackGoal.fromJson(d));
    }
  }

  return listGoal;
}
