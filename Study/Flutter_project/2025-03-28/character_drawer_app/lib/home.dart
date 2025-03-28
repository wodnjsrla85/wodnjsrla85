import 'dart:async';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late TextEditingController textController;
  late List<String> inputTexts;
  late int current;
  late String outputText;
  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
    inputTexts = [];
    current = 0;
    outputText = '';
  }  

  textCreative(){
    if(textController.text.trim().isEmpty){
      textController.text = 'Hello';
    }else{
      inputTexts = textController.text.split('');
      outputText = inputTexts[current];
      Timer.periodic(Duration(seconds: 2), (timer) => resultText(),);
    }
    setState(() {});
  }
  resultText(){
    current ++;
    if(current >= inputTexts.length){
      current = 0;
      outputText = inputTexts[current];
    }else{
      outputText += inputTexts[current];
    }
    setState(() {});
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'LED 광고',
        ),
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text(
          outputText,
          style: TextStyle(
            fontSize: 80,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.red
              ),
              child: Text(
                '광고 문구를 입력하세요',
                style: TextStyle(
                  color: Colors.amber,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ),
            TextField(
              controller: textController,
              decoration: InputDecoration(
                labelText: '광고문구를 입력하세요',
              ),
              keyboardType: TextInputType.text,
            ),
            ElevatedButton(
              onPressed:() => textCreative(), 
              child: Text(
                '문구 생성 하기'
              ),
            ),
          ],
        ),
      ),
    );
  }
}