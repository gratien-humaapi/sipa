import 'package:flutter/material.dart';
import 'package:sipa/screen/intro.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Sipa ♠️♣️🧡🔶',
      debugShowCheckedModeBanner: false,
      home: IntroPage(),
    );
  }
}
