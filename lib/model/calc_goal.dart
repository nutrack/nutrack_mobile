// To parse this JSON data, do
//
//     final nutrackGoal = nutrackGoalFromJson(jsonString);

import 'dart:convert';

List<NutrackGoal> nutrackGoalFromJson(String str) => List<NutrackGoal>.from(json.decode(str).map((x) => NutrackGoal.fromJson(x)));

String nutrackGoalToJson(List<NutrackGoal> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NutrackGoal {
    NutrackGoal({
        required this.model,
        required this.pk,
        required this.fields,
    });

    String model;
    int pk;
    Fields fields;

    factory NutrackGoal.fromJson(Map<String, dynamic> json) => NutrackGoal(
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
        required this.goal,
    });

    int user;
    int goal;

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        goal: json["goal"],
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "goal": goal,
    };
}
