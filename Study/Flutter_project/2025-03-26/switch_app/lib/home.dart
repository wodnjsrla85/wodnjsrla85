import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late bool switchValue;
  late String imageValue;
  late String appBarTitle;
  @override
  void initState() {
    super.initState();
    switchValue = true;
    appBarTitle = '피카츄';
    imageValue = 'images/picachu.jpg';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(appBarTitle)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 300, width: 300, child: Image.asset(imageValue)), //크기를 맞춰서 다른 위젯들이 안움직이게 하는것
            Switch(
              //모양이 바뀌는 위젯은 onChanged값을 준다.
              value: switchValue, //스위치의 초기값 (변수로 지정 bool)
              onChanged: (value) {
                //value는 사용자가 바꿨을때의
                switchValue = value; //사용자가 바꿨을때의 값
                changeAppbarTitle(); //on/off일때 바뀔값들
              },
              activeColor: Colors.yellow, 
              activeTrackColor: Colors.amber,
            ),
          ],
        ),
      ),
    );
  }

  changeAppbarTitle() {
    switchValue == true //switch의 상태에 맞는 값들을 반환
        ? {appBarTitle = '피카츄', imageValue = 'images/picachu.jpg'}
        : {appBarTitle = '스마일', imageValue = 'images/smile.png'};
    setState(() {});
  }
}
