import 'package:flutter/material.dart';
import 'package:sanckbar/snackbar.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) { 
    //Build는 rander하는 함수 Scaffold의 모든부분을 rander context Scaffold의 구성된 화면의 메모리
    return Scaffold(
      appBar: AppBar(
        title: Text('Snack bar', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.amber,
        foregroundColor: Colors.black,
      ),
      body: MySnackBar(), //SnackBar의 파일을 따로 만들어서 불러오기만 한것
    );
  }//build
}//class
