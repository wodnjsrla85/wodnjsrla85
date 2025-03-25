import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Alert Dialog with Gesture')),
      body: Center(
        child: GestureDetector(
          onTap: () => _showDialog(context),
          child: Text('Hello World!'),
        ),
      ),
    );
  } // buld

  // ---- Functions ----
  _showDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, //button을 눌러야만 종료 시킬 수 있다.
      barrierColor: Colors.amber,//barrier의 컬러색 변경
      builder: (context) {
        return AlertDialog(
          title: Text('Alert Title'),
          content: Text('Hello World를 Touch했습니다.'),
          actions: [
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop(context);
                  //다른화면으로 갈려고 하면 alert_dialog를 팝하고 가야한다.
                  //화면이 2개여서 2번째 화면에서 alertdialog를 종료를 누르면 2번째화면으로 가는게 아니라 첫번째 화면으로 가기 때문에 of(context)를 해줘야한다.
                },
                child: Text('종료'),
              ),
            ),
          ],
        );
      },
    );
  }
} //Home
