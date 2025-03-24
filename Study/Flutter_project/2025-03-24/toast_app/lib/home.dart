import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Toast Message')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Fluttertoast.showToast(
              msg: 'Toast Button is clicked.', //매세지 내용
              gravity: ToastGravity.CENTER, //메세지 발생 위치
              fontSize: 20, //메세지 크기
              textColor: Colors.yellow, //메세지 색상
              backgroundColor: Colors.red, //메세지 배경 색상
              toastLength: Toast.LENGTH_SHORT, //메세지 발생 시간
            );
          },
          child: Text('Toast Button'),
        ),
      ),
    );
  }
}
