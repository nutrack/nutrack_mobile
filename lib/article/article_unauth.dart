import 'package:nutrack_mobile/article/screens/article_detail.dart';
import 'package:nutrack_mobile/article/screens/article_detail_unauth.dart';
import 'package:nutrack_mobile/article/fetch/article_get.dart';
import 'package:nutrack_mobile/widget/unauth_drawer.dart';

import 'package:flutter/material.dart';

class MyUnauthArticlePage extends StatefulWidget {
  static const routeName = '/article-unauth';
  const MyUnauthArticlePage({super.key});

  @override
  State<MyUnauthArticlePage> createState() => _MyUnauthArticlePageState();
}

class ArticleData {
  final String? judul;
  final String? penulis;
  final String? artikel;
  final List<CommentData> comment;

  ArticleData(String this.judul, String this.penulis, String this.artikel,
      this.comment);
}

class _MyUnauthArticlePageState extends State<MyUnauthArticlePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Article'),
      ),
      drawer: const NutrackUnAuthDrawer(),
      body: FutureBuilder(
        future: fetchArticle(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData) {
              return Column(
                children: const [
                  Text(
                    "Belum Ada Artikel :(",
                    style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0), fontSize: 20),
                  ),
                  SizedBox(height: 8)
                ],
              );
            } else {
              return ListView.separated(
                padding: const EdgeInsets.all(20.0),
                itemCount: snapshot.data!.length,
                itemBuilder: (_, id) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: const BorderSide(
                              width: 0.5, color: Color(0xFFF0B32B))),
                      title: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.person_sharp,
                                    color: Color(0xFF0a4d3c),
                                    size: 16,
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 5, 0, 10),
                                    child: Text(
                                      snapshot.data![id].fields.author.toString(),
                                      textAlign: TextAlign.left,
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF0a4d3c)),
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                snapshot.data![id].fields.title.toString(),
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ],
                          )),
                      subtitle: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                                child: Text(
                                  snapshot.data![id].fields.articlePost.toString(),
                                  maxLines: 2,
                                  textAlign: TextAlign.left,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              )
                            ],
                          )),
                      tileColor: const Color.fromARGB(192, 247, 225, 85),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => UnauthArticleItemPage(
                                  judul: snapshot.data![id].fields.title.toString(),
                                  penulis: snapshot.data![id].fields.author.toString(),
                                  artikel: snapshot.data![id].fields.articlePost.toString(),
                                  index: snapshot.data![id].pk,
                                )));
                      },
                    ),
                  );
                },
                separatorBuilder: (context, id) => const SizedBox(
                  height: 10,
                ),
              );
            }
          }
        },
      ),
    );
  }
}
