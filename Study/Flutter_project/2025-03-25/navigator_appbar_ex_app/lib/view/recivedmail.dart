import 'package:flutter/material.dart';

class RecivedMail extends StatelessWidget {
  const RecivedMail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(
        //   onPressed: () => Navigator.popAndPushNamed(context, '/mail'), 
        //   icon: Icon(
        //     Icons.arrow_back,
        //   ),
        //   color: Colors.white,
        // ),
        title: Text(
          'RecivedMail',
          style: TextStyle(
            color: Colors.white
          ),
        ),
        backgroundColor: Colors.red,
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