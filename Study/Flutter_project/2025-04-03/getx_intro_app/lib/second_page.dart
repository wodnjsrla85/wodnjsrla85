import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  // Property
  var value = Get.arguments ?? "__";
  //?? 데이터가 null이 들어왔을 경우 _로 바꾼다는 뜻
  //Arguments가 여러개면 value라는 데이터가 List가 된다.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              'Single Arguments : $value',
            ),
            Text(
              'Multiple Arguments : ${value[0]}\n'
              'Multiple Arguments : ${value[1]}',
            ),
            ElevatedButton(
              onPressed: () => Get.back(result: "Good"), 
              //앞에 화면에 보내줄 값
              child: Text('Reply'),
            ),
          ],
        ),
      ),
    );
  }
}