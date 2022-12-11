import 'package:nutrack_mobile/article/article.dart';

import 'package:flutter/material.dart';
import 'package:nutrack_mobile/widget/drawer_menu.dart';

import 'dart:convert' as convert;

import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

List<ArticleData> article = [];

class MyArticleFormPage extends StatefulWidget {
  static const routeName = '/articleform';
  const MyArticleFormPage({super.key});

  @override
  State<MyArticleFormPage> createState() => _MyArticleFormPageState();
}

class _MyArticleFormPageState extends State<MyArticleFormPage> {
  final _formKey = GlobalKey<FormState>();
  final textField = TextEditingController();

  String? judul;
  String? penulis;
  String? artikel;
  String? date;
  String? like;

  void addArticleToJson(request) async {
    var data = convert.jsonEncode(<String, dynamic>{
      'author': penulis,
      'date': DateTime.now(),
      'like': 0,
      'title': judul,
      'article_post': artikel
    });

    final response = await request.postJson(
        'https://nu-track.up.railway.app/article/add-flutter/', data);

    if (response['status'] == 'success') {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Article has been added!"),
      ));
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const MyArticlePage()));
    } 
    
    else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("An error occured, please try again."),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>(); // TODO ini belom diurus

    return Scaffold(
      appBar: AppBar(
        title: const Text('Write your Article'),
      ),
      drawer: NutrackDrawer(),
      body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(20.0),
              child: Column(children: [
                const Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    "Write Your Article Here",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Color(0xFF0a4d3c)),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Judul Artikel",
                      labelStyle: const TextStyle(color: Color(0xFF0a4d3c)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(
                            color: Color(0xFF9AB94D), width: 1.0),
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
                    onChanged: (String? value) {
                      setState(() {
                        judul = value!;
                      });
                    },
                    onSaved: (String? value) {
                      setState(() {
                        judul = value!;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Judul tidak boleh kosong!';
                      }
                      return null;
                    },
                  ),
                ),

                // penulis input
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Penulis",
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

                    // Menambahkan behavior saat nama diketik
                    onChanged: (String? value) {
                      setState(() {
                        penulis = value!;
                      });
                    },

                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        penulis = value!;
                      });
                    },

                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Penulis tidak boleh kosong!';
                      }
                      return null;
                    },
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Your Article Here",
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
                        artikel = value!;
                      });
                    },

                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        artikel = value!;
                      });
                    },

                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Artikel tidak boleh kosong!';
                      }
                      return null;
                    },
                  ),
                ),
              ]),
            ),
          )),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 50,
          width: 10,
          child: TextButton(
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(const Color(0xFF0a4d3c)),
            ),
            child: const Text(
              "Simpan",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                article.add(ArticleData(judul.toString(), penulis.toString(),
                    artikel.toString(), []));
                addArticleToJson(request);
              }

              // Navigator.of(context).push(MaterialPageRoute(
              //     builder: (context) => const MyArticlePage()));
            },
          ),
        ),
      ),
    );
  }
}
