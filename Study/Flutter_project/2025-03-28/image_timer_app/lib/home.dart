import 'dart:async'; 

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //property(전역변수)
  late List<String> imagesFile;
  late int currentPage;
  
  @override
  void initState() {
    super.initState();
    imagesFile = [
      'flower_01.png',
      'flower_02.png',
      'flower_03.png',
      'flower_04.png',
      'flower_05.png',
      'flower_06.png',
    ];

    currentPage = 0;

    // Timer 설치 Timer가 2개다 하나는 async 하나는 dart에 있는 timer (async를 가지고 와야한다)
    Timer.periodic(Duration(seconds: 3), (timer) {
      //3초동안 마다 안에 있는 함수를 실행 시킨다.
      changeImage();
    },);    
  }

  changeImage(){
    currentPage ++;
    if(currentPage >= imagesFile.length){
      currentPage =0;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '3초마다 이미지 무한 반복'
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            imagesFile[currentPage],
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ClipRRect( //이미지들의 테두리를 쉽게 깍는 widget
              borderRadius: BorderRadius.circular(20),
              //모서리 값 변경
              child: Image.asset(
                'images/${imagesFile[currentPage]}'
              ),
            ),
          ),


        ],
      ),
    );
  }
}