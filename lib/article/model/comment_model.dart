// To parse this JSON data, do
//
//     final commentItem = commentItemFromJson(jsonString);

import 'dart:convert';

List<CommentItem> commentItemFromJson(String str) => List<CommentItem>.from(json.decode(str).map((x) => CommentItem.fromJson(x)));

String commentItemToJson(List<CommentItem> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CommentItem {
    CommentItem({
        required this.model,
        required this.pk,
        required this.fields,
    });

    String model;
    int pk;
    Fields fields;

    factory CommentItem.fromJson(Map<String, dynamic> json) => CommentItem(
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
        required this.art,
        required this.user,
        required this.commentPost,
        required this.artid,
    });

    int art;
    int user;
    String commentPost;
    String artid;

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        art: json["art"],
        user: json["user"],
        commentPost: json["comment_post"],
        artid: json["artid"],
    );

    Map<String, dynamic> toJson() => {
        "art": art,
        "user": user,
        "comment_post": commentPost,
        "artid": artid,
    };
}
