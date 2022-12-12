import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/article_model.dart';

Future<List<ArticleItem>> fetchArticle() async {
  var url = Uri.parse(
      'https://nu-track.up.railway.app/article/json-article/');
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
  
  List<ArticleItem> listArticle = [];
    for (var d in data) {

      
      // print(d);
      if (d != null) {
        listArticle.add(ArticleItem.fromJson(d));
      }
     
    }
  
  return listArticle;
}