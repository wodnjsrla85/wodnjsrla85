import 'package:flutter/material.dart';

class First2Page extends StatelessWidget {
  const First2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First2 Page'),
      ),
      body: Center(
        child: Text('Here is First2 Page'),
      ),
    );
  }
}