import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () => Navigator.pushNamed(context, '/1'), 
              child: Text('Go to first page'),
            ),
            TextButton(
              onPressed: () => Navigator.pushNamed(context, '/3'), 
              child: Text('Go to second page'),
            ),
          ],
        ),
      ),
    );
  }
}
