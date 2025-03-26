import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late bool switchValue;
  late Color buttonColor;
  @override
  void initState() {
    super.initState();
    switchValue = false;
    buttonColor = Colors.blue;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Changed Button color on switch',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: false,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                switchValue == false ? switchValue = true : switchValue = false;
                //함수에서는 switch의 위치값에 따른 결과 값을 출력하니깐 함수실행전에 버튼을 눌렀을때 switch값을 바꿔 줘야 한다.
                changeButton(switchValue);
              },
              style: ElevatedButton.styleFrom(backgroundColor: buttonColor),
              child: Text('Flutter', style: TextStyle(color: Colors.white)),
            ),
            Switch(
              value: switchValue,
              onChanged: (value) {
                switchValue = value;
                changeButton(switchValue);
              },
              activeColor: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }

  changeButton(bool a) {
    switchValue == false
        ? {buttonColor = Colors.blue}
        : {buttonColor = Colors.red};
    setState(() {});
  }
}
