// To parse this JSON data, do
//
//     final calcItem = calcItemFromJson(jsonString);

import 'dart:convert';

List<CalcItem> calcItemFromJson(String str) => List<CalcItem>.from(json.decode(str).map((x) => CalcItem.fromJson(x)));

String calcItemToJson(List<CalcItem> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CalcItem {
    CalcItem({
        required this.id,
        required this.userId,
        required this.date,
        required this.calory,
    });

    int id;
    int userId;
    DateTime date;
    int calory;

    factory CalcItem.fromJson(Map<String, dynamic> json) => CalcItem(
        id: json["id"],
        userId: json["user_id"],
        date: DateTime.parse(json["date"]),
        calory: json["calory"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "date": date.toIso8601String(),
        "calory": calory,
    };
}
