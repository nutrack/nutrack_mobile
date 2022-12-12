import 'package:nutrack_mobile/widget/drawer_menu.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'article_detail.dart';
import 'package:nutrack_mobile/article/article.dart';
import 'package:flutter/material.dart';
import 'dart:convert' as convert;

class CommentFormPage extends StatefulWidget {
  static const routeName = '/commentform';
  const CommentFormPage({
      super.key, 
      required this.index, 
      required this.judul,
      required this.penulis,
      required this.artikel});

  final int index;
  final String judul;
  final String penulis;
  final String artikel;

  @override
  // ignore: no_logic_in_create_state
  State<CommentFormPage> createState() => _CommentFormPageState(index: index, judul: judul, penulis: penulis, artikel: artikel);
}

class _CommentFormPageState extends State<CommentFormPage> {
  _CommentFormPageState({
      required this.index, 
      required this.judul,
      required this.penulis,
      required this.artikel});

  final _formKey = GlobalKey<FormState>();
  final int index;
  final String judul;
  final String penulis;
  final String artikel;
  
  String? commentText;
  String? username;

  List<CommentData>? commentDetail;

  void getComment() {
    commentDetail = comment.where((i) => i.pk == index).toList();
  }

  @override
  Widget build(BuildContext context) {
    // final request = context.watch<CookieRequest>();
    getComment();

    return Scaffold(
      appBar: AppBar(
          title: Row(
        children: const [
          Text("Comment Section")
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
                    hintText: "Your Name Will Be Displayed as",
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
                      username = value!;
                    });
                  },

                  // Menambahkan behavior saat data disimpan
                  onSaved: (String? value) {
                    setState(() {
                      username = value!;
                    });
                  },

                  // Validator sebagai validasi form
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Username tidak boleh kosong!';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Add Comment...",
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.send_rounded),
                      onPressed: () {
                        comment.add(CommentData(username!, commentText, index));
                        // addCommentToJson(request);
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ArticleItemPage(
                                judul: judul,
                                penulis: penulis,
                                artikel: artikel,
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
                      return 'Comment nya apa? :(';
                    }
                    return null;
                  },
                ),
              ),

              // --- Comment Section --- //
              Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 15, 0, 10),
                    child: Text(
                      'COMMENTS',
                      style: TextStyle(
                          fontSize: 20,
                          color: Color(0xFF0a4d3c),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),

              Column(
                children: [
                  for (var com in commentDetail!)
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: ListTile(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: const BorderSide(
                                  width: 0.5, color: Colors.black12)),
                          title: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 5, 0, 5),
                                        child: Text(
                                          com.username
                                              .toString(),
                                          textAlign: TextAlign.left,
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFF0a4d3c)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                          subtitle: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 0, 5),
                                    child: Text(
                                      com.comment
                                          .toString(),
                                      textAlign: TextAlign.left,
                                    ),
                                  )
                                ],
                              )),
                          tileColor: const Color.fromARGB(192, 247, 225, 85)),
                    )
                ],
              ),
            ],
          ),
        )),
      ),
    );
  }
}
