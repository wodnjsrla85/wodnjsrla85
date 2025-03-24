import 'package:flutter/material.dart';

class Second2Page extends StatelessWidget {
  const Second2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First2 Page'),
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('return'),
            ),
          ],
        )
      ),
    );
  }
}