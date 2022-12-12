import 'package:nutrack_mobile/main.dart';
import 'package:flutter/material.dart';
import 'package:nutrack_mobile/provider/net_service.dart';
import 'package:provider/provider.dart';
import 'package:nutrack_mobile/widget/unauth_drawer.dart';
import 'package:nutrack_mobile/screens/login.dart';

class FaqPage extends StatefulWidget {
  const FaqPage({Key? key}) : super(key: key);
  static const routeName = '/faq';
  @override
  State<FaqPage> createState() => _FaqState();
}

class _FaqState extends State<FaqPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("FAQs"),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          Card(
            color: Colors.orange,
            elevation: 4,
            child: ExpansionTile(
              iconColor: Colors.white,
              collapsedIconColor: Colors.white,
              childrenPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              expandedCrossAxisAlignment: CrossAxisAlignment.end,
              title: Text(
                "Apa saya harus membuat akun untuk menggunakan situs web ini?" , 
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold,),),
              children: [
                    Text("Pengguna tetap bisa mengakses aplikasi ini walau tidak membuat akun. Hanya saja, pengguna bisa menggunakan fitur tertentu, seperti CaloryCalc, jika pengguna mendaftarkan akun di Nutrack.",
                        style: const TextStyle(color: Colors.white)),
                  ]),
          ),
          Card(
            color: Colors.orange,
            elevation: 4,
            child: ExpansionTile(
              iconColor: Colors.white,
              collapsedIconColor: Colors.white,
              childrenPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              expandedCrossAxisAlignment: CrossAxisAlignment.end,
              title: Text(
                'Bagaimana saya bisa menggunakan fitur "CaloryCalc"?', 
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold,),),
              children: [
                    Text("Pengguna dapat mendaftarkan akun dan melakukan login di situs web Nutrack. Dengan begitu, pengguna sudah bisa menggunakan fitur CaloryCalc.",
                        style: const TextStyle(color: Colors.white)),
                  ]),
          ),
          Card(
            color: Colors.orange,
            elevation: 4,
            child: ExpansionTile(
              iconColor: Colors.white,
              collapsedIconColor: Colors.white,
              childrenPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              expandedCrossAxisAlignment: CrossAxisAlignment.end,
              title: Text(
                "Apa yang dapat saya lakukan pada Food Recommendation?", 
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold,),),
              children: [
                    Text("Pengguna dapat melakukan filtering rekomendasi makanan berdasarkan nama makanan dan rating-nya. Selain itu, pengguna juga bisa menambahkan rekomendasi makanan yang ingin pengguna bagikan ke khalayak.",
                        style: const TextStyle(color: Colors.white)),
                  ]),
          ),
          Card(
            color: Colors.orange,
            elevation: 4,
            child: ExpansionTile(
              iconColor: Colors.white,
              collapsedIconColor: Colors.white,
              childrenPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              expandedCrossAxisAlignment: CrossAxisAlignment.end,
              title: Text(
                'Pada fitur "Articles", apakah saya hanya bisa membaca artikel?', 
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold,),),
              children: [
                    Text("Tentu saja tidak. Selain membaca artikel, pengguna juga bisa menuliskan artikel yang berhubungan gizi dan diet.",
                        style: const TextStyle(color: Colors.white)),
                  ]),
          ),
          Card(
            color: Colors.orange,
            elevation: 4,
            child: ExpansionTile(
              iconColor: Colors.white,
              collapsedIconColor: Colors.white,
              childrenPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              expandedCrossAxisAlignment: CrossAxisAlignment.end,
              title: Text(
                "Apakah saya dapat memberikan kritik dan saran kepada pengembang?", 
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold,),),
              children: [
                    Text("Tentu saja bisa. Para pengunjung situs web Nutrack dapat memberikan masukkan kepada pengembang terkait pengalaman ketika mengunjungi situs web Nutrack. Segala kritik dan saran sangat kami harapkan guna peningkatan kualitas Nutrack.",
                        style: const TextStyle(color: Colors.white)),
                  ]),
          ),
        ],
      ),
  );
}
