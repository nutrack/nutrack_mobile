import 'package:http/http.dart' as http;
import '/model/comment_model.dart';
import 'dart:convert';
import '../model/article_model.dart';

Future<List<CommentItem>> fetchComment() async {
  var url = Uri.parse(
      'https://nu-track.up.railway.app/article/json-comment/');
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
  
  List<CommentItem> listComment = [];
    for (var d in data) {

      // print(d);
      if (d != null) {
        listComment.add(CommentItem.fromJson(d));
      }
     
    }
  
  return listComment;
}