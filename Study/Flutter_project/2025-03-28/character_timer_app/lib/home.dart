import 'dart:async';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<String> texts; //받은 텍스트들을 split으로 분리해서 넣는것 
  late int current; //몇번째 인덱슨지 넣는값
  late String text; //출력값
  late String data;  // 받은값
  @override
  void initState() {
    super.initState();
    
    data = "대한민국";
    texts = data.split('');
    current = 0;
    text = texts[current];
    

    Timer.periodic(Duration(seconds: 1), (timer) {
      changeText();
    },
    );
  }

  changeText(){
    current++;
    if(current >= texts.length){
      current = 0;
      text = texts[current];
    }else{
      text += texts[current]; //출력값을 하나씩 더해서 늘려준다.
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'LED 광고',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.grey,
        foregroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}