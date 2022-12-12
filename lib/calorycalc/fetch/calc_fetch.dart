import 'package:http/http.dart' as http;
import 'package:nutrack_mobile/calorycalc/model/calc_model.dart';
import 'package:nutrack_mobile/provider/net_service.dart';
import 'dart:convert';
import  'package:pbp_django_auth/pbp_django_auth.dart';


Future<List<CalcItem>> fetchCalc(NetworkService request) async {
  var response = await request.get(
     'https://nu-track.up.railway.app/calorycalc/json_flutter/',
  );


  var data=response;
  
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