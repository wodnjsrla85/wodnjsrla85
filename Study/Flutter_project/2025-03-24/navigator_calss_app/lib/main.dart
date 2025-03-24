import 'package:flutter/material.dart';
import 'package:navigator_calss_app/View/firstpage.dart';
import 'package:navigator_calss_app/View/home.dart';
import 'package:navigator_calss_app/View/secondpage.dart';

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
      initialRoute: '/', //<=첫 화면 지정
      routes: {//map형식 *home대신 경로 지정
        '/' : (context) => Home(),
        '/1st' : (context) => FirstPage(),
        '/2nd' : (context) => SecondPage(),
      },
    );
  }
}
