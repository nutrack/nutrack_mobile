import 'package:nutrack_mobile/article/fetch/comment_get.dart';
import 'package:nutrack_mobile/article/screens/article_detail.dart';
import 'package:nutrack_mobile/article/article.dart';
import 'package:flutter/material.dart';
import 'package:nutrack_mobile/widget/unauth_drawer.dart';

class UnauthArticleItemPage extends StatelessWidget {
  static const routeName = '/articledetail-unauth';
  UnauthArticleItemPage(
      {super.key,
      required this.judul,
      required this.penulis,
      required this.artikel,
      required this.index});

  final String judul;
  final String penulis;
  final String artikel;
  // final List<CommentData> comment;
  final int index;

  List<CommentData>? commentDetail;

  void getComment() {
    commentDetail = comment.where((i) => i.pk == index).cast<CommentData>().toList();
  }

  @override
  Widget build(BuildContext context) {
    getComment();
    return Scaffold(
        appBar: AppBar(
          title: const Text(''),
        ),
        drawer: const NutrackUnAuthDrawer(),
        body: ListView(
          padding: const EdgeInsets.all(20.0),
          shrinkWrap: true,
          children: <Widget>[
            Row(children: [
              const Icon(
                Icons.person_sharp,
                color: Color(0xFF0a4d3c),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 3),
                child: Text(
                  penulis,
                  style:
                      const TextStyle(fontSize: 16, color: Color(0xFF0a4d3c)),
                ),
              ),
            ]),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 15, 0, 10),
              child: Text(
                judul,
                style: const TextStyle(
                    color: Color(0xFF0a4d3c),
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
                textAlign: TextAlign.left,
              ),
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(0, 7, 0, 20),
                child: Text(
                  artikel,
                  style: const TextStyle(fontSize: 16),
                  maxLines: 1000000,
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                )),

            // --- Comment Section --- //
            Row(
              children: const [
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
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
        ));
  }
}