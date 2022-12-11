import 'fetch/article_get.dart';
import 'page/article_detail.dart';
// import 'package:nutrack_mobile/main.dart';
import 'page/article_form.dart';
import 'package:flutter/material.dart';

class MyArticlePage extends StatefulWidget {
  const MyArticlePage({super.key});

  @override
  State<MyArticlePage> createState() => _MyArticlePageState();
}

class ArticleData {
  final String? judul;
  final String? penulis;
  final String? artikel;
  final List<CommentData> comment;

  ArticleData(String this.judul, String this.penulis, String this.artikel,
      this.comment);
}

class _MyArticlePageState extends State<MyArticlePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Article'),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            // ListTile(
            //   title: const Text('Home'),
            //   onTap: () {
            //     Navigator.pushReplacement(
            //       context,
            //       MaterialPageRoute(
            //           builder: (context) => const MyHomePage(
            //                 title: '',
            //               )),
            //     );
            //   },
            // ),
            ListTile(
              title: const Text('Artikel'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MyArticlePage()),
                );
              },
            ),
          ],
        ),
      ),
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
                    "Belum Ada Artikel",
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
                            builder: (context) => ArticleItemPage(
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
      // Form(
      //   child: SingleChildScrollView(
      //       child: Container(
      //           padding: const EdgeInsets.all(20.0),
      //           child: Column(
      //             children: [
      //               const Text(
      //                 "Article Post",
      //                 style: TextStyle(
      //                     fontWeight: FontWeight.bold, fontSize: 18),
      //                 textAlign: TextAlign.center,
      //               ),
      //               const Padding(
      //                 padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
      //                 child: Text(
      //                   "Read More About The Latest Article of Nutrition Here!",
      //                   style: TextStyle(
      //                       fontWeight: FontWeight.bold,
      //                       fontSize: 24,
      //                       color: Color(0xFF0a4d3c)),
      //                   textAlign: TextAlign.center,
      //                 ),
      //               ),
      //               for (int i = 0; i < article.length; i++)
      //                 // for (var data in article)
      // Padding(
      //   padding: const EdgeInsets.all(8.0),
      //   child: ListTile(
      //     shape: RoundedRectangleBorder(
      //         borderRadius: BorderRadius.circular(20),
      //         side: const BorderSide(
      //             width: 0.5, color: Color(0xFFF0B32B))),
      //     title: Padding(
      //         padding: const EdgeInsets.all(5.0),
      //         child: Column(
      //           crossAxisAlignment:
      //               CrossAxisAlignment.start,
      //           children: [
      //             Row(
      //               children: [
      //                 const Icon(
      //                   Icons.person_sharp,
      //                   color: Color(0xFF0a4d3c),
      //                   size: 16,
      //                 ),
      //                 Padding(
      //                   padding: const EdgeInsets.fromLTRB(
      //                       10, 5, 0, 10),
      //                   child: Text(
      //                     article[i].penulis.toString(),
      //                     textAlign: TextAlign.left,
      //                     style: const TextStyle(
      //                         fontSize: 14,
      //                         fontWeight: FontWeight.bold,
      //                         color: Color(0xFF0a4d3c)),
      //                   ),
      //                 ),
      //               ],
      //             ),
      //             Text(
      //               article[i].judul.toString(),
      //               style: const TextStyle(
      //                   fontSize: 20,
      //                   fontWeight: FontWeight.bold),
      //             ),
      //           ],
      //         )),
      //     subtitle: Padding(
      //         padding: const EdgeInsets.all(5.0),
      //         child: Column(
      //           crossAxisAlignment:
      //               CrossAxisAlignment.start,
      //           children: [
      //             Padding(
      //               padding: const EdgeInsets.fromLTRB(
      //                   0, 5, 0, 5),
      //               child: Text(
      //                 article[i].artikel.toString(),
      //                 maxLines: 2,
      //                 textAlign: TextAlign.left,
      //                 overflow: TextOverflow.ellipsis,
      //               ),
      //             )
      //           ],
      //         )),
      //     tileColor:
      //         const Color.fromARGB(192, 247, 225, 85),
      //     onTap: () {
      //       Navigator.of(context).push(MaterialPageRoute(
      //           builder: (context) => ArticleItemPage(
      //                 judul: article[i].judul.toString(),
      //                 penulis: article[i].penulis.toString(),
      //                 artikel: article[i].artikel.toString(),
      //                 comment: article[i].comment,
      //                 index: i,
      //               )));
      //     },
      //   ),
      // )
      //             ],
      //           )))),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Write New Article',
        backgroundColor: const Color(0xFF0a4d3c),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const MyArticleFormPage()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
