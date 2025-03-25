import 'package:flutter/material.dart';

//보안 떄문에 Class가 2개이다.
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

//변수의 현재 값 을 나타내는것 state
class _HomeState extends State<Home> {
  //Property(Field, Attribute)
  late String buttonState; //실행 순서 1
  late Color buttonColor;
  @override
  void initState() {
    //실행순서 2 변수에 초기값을 주는곳
    super.initState();
    buttonState = 'OFF';
    buttonColor = Colors.blue;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Life cycle')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => _onClick(),
              child: Text('버튼을 누르세요'),
              style: ElevatedButton.styleFrom(
                backgroundColor: buttonColor,
                foregroundColor: Colors.white,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text('버튼 상태 : '), Text(buttonState)],
            ),
          ],
        ),
      ),
    );
  } // build

  //---- Functions ----
  _onClick() {
    buttonState == 'ON' ? {buttonState = 'OFF',buttonColor = Colors.black} : {buttonState = "ON", buttonColor = Colors.blue};
    //화면이 바꾼다는 것을 build에게 알려주는 함수가 setState
    setState(() {});
  }
} // Class
