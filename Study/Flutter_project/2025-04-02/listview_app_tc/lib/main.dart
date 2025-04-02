import 'package:flutter/material.dart';
import 'package:listview_app_tc/home.dart';
import 'package:listview_app_tc/view/login.dart';

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
        '/' : (context) => Login(),
        '/1' : (context) => Home(),
      },
    );
  }
}

