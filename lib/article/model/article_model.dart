// To parse this JSON data, do
//
//     final articleItem = articleItemFromJson(jsonString);

import 'dart:convert';

List<ArticleItem> articleItemFromJson(String str) => List<ArticleItem>.from(json.decode(str).map((x) => ArticleItem.fromJson(x)));

String articleItemToJson(List<ArticleItem> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ArticleItem {
    ArticleItem({
        required this.model,
        required this.pk,
        required this.fields,
    });

    String model;
    int pk;
    Fields fields;

    factory ArticleItem.fromJson(Map<String, dynamic> json) => ArticleItem(
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
        required this.author,
        required this.date,
        required this.like,
        required this.title,
        required this.articlePost,
    });

    int user;
    String author;
    DateTime date;
    String like;
    String title;
    String articlePost;

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        author: json["author"],
        date: DateTime.parse(json["date"]),
        like: json["like"],
        title: json["title"],
        articlePost: json["article_post"],
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "author": author,
        "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "like": like,
        "title": title,
        "article_post": articlePost,
    };
}
