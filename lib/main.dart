import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'screens/news_list.dart';
import 'screens/products_lists_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Qart',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const NewsListPage(),
    );
  }
}
