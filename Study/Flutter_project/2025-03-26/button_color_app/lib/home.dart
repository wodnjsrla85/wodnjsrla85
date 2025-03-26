import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //전역 변수
  late String buttonText;
  late bool buttonCheck;
  late Color buttonColor;
  late int buttonCount;
  late Color mainColor;

  @override
  void initState() {
    super.initState();
    buttonText = 'Flutter';
    buttonCheck = false; //Hello : true , Flutter : false
    buttonColor = Colors.blue;
    buttonCount = 0;
    mainColor = Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      appBar: AppBar(
        title: Text(
          'Change button color & text',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => onClick(),
          style: ElevatedButton.styleFrom(
            backgroundColor: buttonColor,
            foregroundColor:
                buttonColor == Colors.amber ? Colors.black : Colors.white,
          ),
          child: Text(buttonText),
        ),
      ),
    );
  }

  onClick() {
    //제일 작은 단위로 비교해야 하면 데이터 사용량이 적으니깐 bool변수로 비교
    print('현재 상태 $buttonText , $buttonCheck, $buttonColor');
    buttonCount % 10 == 0 && mainColor == Colors.white
        ? mainColor = Colors.amber
        : buttonCount % 10 == 0 && mainColor == Colors.amber
        ? mainColor = Colors.white : 
    buttonCheck == false
        ? {buttonText = 'hello', buttonColor = Colors.amber, buttonCheck = true}
        : {
          buttonText = 'Flutter',
          buttonColor = Colors.blue,
          buttonCheck = false,
        };
    buttonCount += 1;
    print('바뀐 상태 : $buttonText , $buttonCheck, $buttonColor');
    print('------------------------------------');
    print(buttonCount);
    setState(() {}); //build와 onClick을 연결 시켜주는 것
  }
}
