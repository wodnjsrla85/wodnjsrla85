import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Alert Dialog')),
      body: Center(
        child: GestureDetector(
          onTap: () => openAlert(context),
          child: Text('Open Alert Dialog'),
        ),
      ),
    );
  }

  openAlert(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: Text('페이지 이동'),
          content: Text('페이지 이동할까요?'),
          actions: [
            FilledButton(
              onPressed: () => Navigator.of(context).pop(context),
              style: FilledButton.styleFrom(backgroundColor: Colors.red),
              child: Text('아니요'),
            ),
            FilledButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, '/1'); //popAndPushNamed 는 닫고 여는거
              },
              style: FilledButton.styleFrom(backgroundColor: Colors.blue),
              child: Text('네'),
            ),
          ],
        );
      },
    );
  }
}
