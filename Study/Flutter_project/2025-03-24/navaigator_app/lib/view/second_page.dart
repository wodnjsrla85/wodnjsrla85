import 'package:flutter/material.dart';
import 'package:navaigator_app/view/third_page.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Second Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); //두번째를 pop해서 첫번째 페이지가 보이게 한다.
              },
              child: Text('Go to the First Page'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ThirdPage();
                    },
                  ),
                ); //두번째를 pop해서 첫번째 페이지가 보이게 한다.
              },
              child: Text('Go to the Third Page'),
            ),
          ],
        ),
      ),
    );
  }
}
