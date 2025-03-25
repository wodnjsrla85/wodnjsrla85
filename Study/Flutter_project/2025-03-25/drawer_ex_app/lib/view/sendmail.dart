import 'package:flutter/material.dart';

class SendMail extends StatelessWidget {
  const SendMail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Send Mail',
          style: TextStyle(
            color: Colors.white
          ),
        ),
        backgroundColor: Colors.green,
        leading: IconButton(
          onPressed: () => Navigator.popAndPushNamed(context, '/mail'), 
          icon: Icon(
            Icons.arrow_back,
          ),
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 100.0),
        child: Column(
          children: [
            Text('mail1'),
            Text('mail2'),
            Text('mail3'),
          ],
        ),
      ),
    );
  }
}