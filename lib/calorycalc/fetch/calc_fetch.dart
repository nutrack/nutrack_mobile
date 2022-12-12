import 'package:http/http.dart' as http;
import 'package:nutrack_mobile/calorycalc/model/calc_model.dart';
import 'dart:convert';

Future<List<CalcItem>> fetchCalc() async {
  var url = Uri.parse(
      'https://nu-track.up.railway.app/calorycalc/json/');
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
  
  List<CalcItem> listCalc = [];
    for (var d in data) {

      
      // print(d);
      if (d != null) {
        listCalc.add(CalcItem.fromJson(d));
      }
     
    }
  
  return listCalc;
}