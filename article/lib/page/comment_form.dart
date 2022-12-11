import 'article_detail.dart';
// import 'package:nutrack_mobile/main.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'article_form.dart';
import 'package:article/article.dart';
import 'package:flutter/material.dart';
import 'dart:convert' as convert;

class CommentFormPage extends StatefulWidget {
  const CommentFormPage({super.key, required this.index});

  final int index;

  @override
  State<CommentFormPage> createState() => _CommentFormPageState(index: index);
}

class _CommentFormPageState extends State<CommentFormPage> {
  _CommentFormPageState({required this.index});

  final _formKey = GlobalKey<FormState>();
  final int index;

  String? commentText;

  void addCommentToJson(request) async {
    var data = convert.jsonEncode(
        <String, dynamic>{'comment_post': commentText, 'art_id': index});

    final response = await request.postJson(
        'https://nu-track.up.railway.app/article/add-comment-flutter/', data);

    if (response['status'] == 'success') {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Article has been added!"),
      ));
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const MyArticlePage()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("An error occured, please try again."),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Scaffold(
      appBar: AppBar(
          title: Row(
        children: [
          Text(article[index].judul.toString()),
          const Text("'s Comment")
        ],
      )),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
            child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Add Comment...",
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.send_rounded),
                      onPressed: () {
                        // article[index].comment.add(CommentData(username!, commentText));
                        addCommentToJson(request);
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ArticleItemPage(
                                judul: article[index].judul.toString(),
                                penulis: article[index].penulis.toString(),
                                artikel: article[index].artikel.toString(),
                                index: index)));
                      },
                    ),
                    labelStyle: const TextStyle(color: Color(0xFF0a4d3c)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(
                        color: Color(0xFF9AB94D),
                        width: 1.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(
                        color: Color(0xFF0a4d3c),
                        width: 2.0,
                      ),
                    ),
                    filled: true,
                    hoverColor: Colors.grey.shade300,
                  ),
                  maxLines: null,

                  // Menambahkan behavior saat nama diketik
                  onChanged: (String? value) {
                    setState(() {
                      commentText = value!;
                    });
                  },

                  // Menambahkan behavior saat data disimpan
                  onSaved: (String? value) {
                    setState(() {
                      commentText = value!;
                    });
                  },

                  // Validator sebagai validasi form
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Comment tidak boleh kosong!';
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
