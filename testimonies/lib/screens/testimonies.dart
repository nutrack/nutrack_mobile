import 'package:nutrack_mobile/widget/unauth_drawer.dart';
import 'package:flutter/material.dart';
import '../api/fetch_testimonies.dart';
import 'package:testimonies/models/testimony.dart';

class TestimonyPage extends StatefulWidget {
  const TestimonyPage({super.key});

  @override
  State<TestimonyPage> createState() => _TestimonyPageState();
}

class _TestimonyPageState extends State<TestimonyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Testimonies'),
      ),
      drawer: const NutrackUnAuthDrawer(),
      body: FutureBuilder(
          future: fetchTestimony(),
          builder: (context, AsyncSnapshot snapshot) {
            print(snapshot);
            if (snapshot.data == null) {
              return const Center(child: CircularProgressIndicator());
            } else {
              if (!snapshot.hasData) {
                return const Center(
                  child: Text("Belum ada testimoni yang dibuat"),
                );
              } else {
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      Testimony t = snapshot.data[index];
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.black54,
                          ),
                          borderRadius: BorderRadius.circular(5.0),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black54,
                              offset: Offset(0, 1.5),
                              blurRadius: 2,
                              spreadRadius: 0,
                            ),
                            BoxShadow(
                              color: Colors.white,
                              offset: Offset(0, 0),
                              blurRadius: 0,
                              spreadRadius: 0,
                            )
                          ],
                        ),
                        margin: const EdgeInsets.only(
                          top: 10.0,
                          left: 10.0,
                          right: 10.0,
                        ),
                        padding: const EdgeInsets.all(4.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  t.title,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  t.username,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontStyle: FontStyle.italic,
                                  ),
                                )
                              ],
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(t.testimony)),

                          ],
                        ),
                      );
                    });
              }
            }
          }),
    );
  }
}
