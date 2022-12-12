// To parse this JSON data, do
//
//     final testimony = testimonyFromJson(jsonString);

import 'dart:convert';

List<Testimony> testimonyFromJson(String str) => List<Testimony>.from(json.decode(str).map((x) => Testimony.fromJson(x)));

String testimonyToJson(List<Testimony> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Testimony {
    Testimony({
        required this.username,
        required this.title,
        required this.testimony,
    });

    String username;
    String title;
    String testimony;

    factory Testimony.fromJson(Map<String, dynamic> json) => Testimony(
        username: json["username"],
        title: json["title"],
        testimony: json["testimony"],
    );

    Map<String, dynamic> toJson() => {
        "username": username,
        "title": title,
        "testimony": testimony,
    };
}
