import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:q_art/models/news_list.dart';
import 'package:q_art/models/product.dart';

class ProductsDetailPage extends StatelessWidget {
  ProductsDetailPage({Key? key, required this.hotnew}) : super(key: key);
  final Hotnew hotnew;
  final AudioPlayer audioPlayer = AudioPlayer();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black87),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black87,
        onPressed: () async {
          await audioPlayer
              .play('https://luan.xyz/files/audio/ambient_c_motion.mp3');
        },
        child: Icon(CupertinoIcons.play_arrow),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.width,
            child: Image.network(
              hotnew.image,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(hotnew.detail),
            ),
          )
        ]),
      ),
    );
  }
}
