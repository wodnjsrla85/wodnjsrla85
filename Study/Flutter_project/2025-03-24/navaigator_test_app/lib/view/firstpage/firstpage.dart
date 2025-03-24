import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Page'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('Here is Second Page'),
            TextButton(
              onPressed: () => Navigator.pushNamed(context, '/2'), 
              child: Text('Go to First 2 Page')),
          ],
        ),
      ),
    );
  }
}