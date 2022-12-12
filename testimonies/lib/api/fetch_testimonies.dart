import '../models/testimony.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<Testimony>> fetchTestimony() async {
  var url = Uri.parse('https://nu-track.up.railway.app/testimonies/json');

  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );
  return testimonyFromJson(utf8.decode(response.bodyBytes));
}
