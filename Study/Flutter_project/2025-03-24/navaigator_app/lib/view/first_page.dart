import 'package:flutter/material.dart';
import 'package:navaigator_app/view/second_page.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('First Page')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context){
                  return SecondPage();
                },
              ),
            );
            //2번째 페이질 닫으면 돌아와야 하니깐 context를 준다.
            //MaterialPageRoute(builder : (context){return 페이지}) 2번째 페이지의 메모리를 잡아주는 것
          },
          child: Text('Go to the Second Page'),
        ),
      ),
    );
  }
}
