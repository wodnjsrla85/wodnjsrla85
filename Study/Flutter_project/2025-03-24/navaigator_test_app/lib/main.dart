import 'package:flutter/material.dart';
import 'package:navaigator_test_app/view/firstpage/first2page.dart';
import 'package:navaigator_test_app/view/firstpage/firstpage.dart';
import 'package:navaigator_test_app/view/home.dart';
import 'package:navaigator_test_app/view/secondpage/second2page.dart';
import 'package:navaigator_test_app/view/secondpage/secondpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: '/',
      routes: {
        '/' : (context) => Home(),
        '/1' : (context) => FirstPage(),
        '/2' : (context) => First2Page(),
        '/3' : (context) => SecondPage(),
        '/4' : (context) => Second2Page(),
      },
    );
  }
}
