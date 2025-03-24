import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('Here is second page'),
            TextButton(
              onPressed: () => Navigator.pushNamed(context, '/4'), 
              child: Text('Go to Second 2 Page')),
          ],
        ),
      ),
    );
  }
}
