import 'package:flutter/material.dart';

import 'view/mail.dart';
import 'view/recivedmail.dart';
import 'view/sendmail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: '/mail',
      routes: {
        '/mail': (context) => Mail(),
        '/sendmail': (context) => SendMail(),
        '/recivedmail': (context) => RecivedMail(),
      },
    );
  }
}

