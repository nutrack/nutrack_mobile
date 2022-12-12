// To parse this JSON data, do
//
//     final calcItem = calcItemFromJson(jsonString);

import 'dart:convert';

List<CalcItem> calcItemFromJson(String str) => List<CalcItem>.from(json.decode(str).map((x) => CalcItem.fromJson(x)));

String calcItemToJson(List<CalcItem> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CalcItem {
    CalcItem({
        required this.model,
        required this.pk,
        required this.fields,
    });

    String model;
    int pk;
    Fields fields;

    factory CalcItem.fromJson(Map<String, dynamic> json) => CalcItem(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
    };
}

class Fields {
    Fields({
        required this.user,
        required this.date,
        required this.calory,
    });

    int user;
    DateTime date;
    int calory;

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        date: DateTime.parse(json["date"]),
        calory: json["calory"],
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "date": date.toIso8601String(),
        "calory": calory,
    };
}
