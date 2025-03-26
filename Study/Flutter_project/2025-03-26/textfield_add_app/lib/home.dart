import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late TextEditingController num1Controller;
  late TextEditingController num2Controller;
  late String clacResult;

  @override
  void initState() {
    super.initState();
    num1Controller = TextEditingController();
    num2Controller = TextEditingController();
    clacResult = "";
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('덧셈 구하기'),
        ),
        body: Column(
          children: [
            TextField(
              controller: num1Controller,
              decoration: InputDecoration(
                labelText: '첫번째 숫자를 입력 하세요.',
              ),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: num2Controller,
              decoration: InputDecoration(
                labelText: '두번째 숫자를 입력 하세요.',
              ),
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(
              onPressed: () {
                calcCheck();
              }, 
              child: Text('덧셈 계산'),
            ),
            Text(
              clacResult,
              style: TextStyle(
                color: Colors.red,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
  calcCheck(){
    if(num1Controller.text.trim().isEmpty || num2Controller.text.trim().isEmpty){
      //둘중에 하나라도 입력이 안되어 있으면 에러 메세지를 보낸다
      errorSnackBar();
    }else{
      int num1 = int.parse(num1Controller.text);
      int num2 = int.parse(num2Controller.text);

      int sum = num1 + num2 ;
      clacResult = '입력한 숫자의 합은 $sum 입니다.';

      setState(() {});
    }
  }

  errorSnackBar(){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
      content: Text('숫자를 입력하세요'),
      duration: Duration(seconds: 1),
      ), 
    );
  }
}