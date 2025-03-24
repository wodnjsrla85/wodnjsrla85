import 'package:flutter/material.dart';
//snackbar구현 파일

class MySnackBar extends StatelessWidget {
  const MySnackBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FilledButton(
            onPressed:
                () => snackBarFunction(
                  context,
                  'Filled Button is clicked',
                  Colors.black,
                  5,
                ), //context라는 공간을 보내줘야한다.
            style: FilledButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
            ),
            child: Text(
              'Snackbar Button',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          FilledButton(
            onPressed:
                () => snackBarFunction(
                  context,//context라는 공간을 보내줘야한다.
                  '버튼이 눌렸습니다.',
                  Colors.red,
                  2,
                ), 
            // ScaffoldMessenger.of(context).showSnackBar( //build의 context와 Scaffoldmessenger의 context와 연결되어 있다는 뜻이다. 공간 할당하는 거다.
            //   SnackBar(
            //     content: Text('Elevated Button is clicked.', style: TextStyle(color: Colors.black),), //표시할 내용
            //     backgroundColor: Colors.red,
            //     duration: Duration(seconds: 1),//다시 내려가는 시간을 설정
            //   ), //실제 Snacbar
            // ); //basic방법
            style: FilledButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
            ),
            child: Text(
              'Snackbar Button',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  } //build

  // ---- Function ----- //
  //변수를 이용하여 객체 마다 다른 메세지,색상,초를 다르게 할 수 있다.
  snackBarFunction(
    BuildContext context,
    String message,
    Color colors,
    int second,
  ) {
    //그냥 context를 하면 dynamic을 사용하기 때문에 buildcontext 타입을 정해서 속도를 빠르게 해준다.
    ScaffoldMessenger.of(context).showSnackBar(
      //build밖에 snackBarFunction이 있기 때문에 연결이 안되어 있다. 그래서 받아와야한다.
      //build의 context와 Scaffoldmessenger의 context와 연결되어 있다는 뜻이다. 공간 할당하는 거다.
      SnackBar(
        content: Text(message), //표시할 내용
        backgroundColor: colors,
        duration: Duration(seconds: second), //다시 내려가는 시간을 설정
      ), //실제 Snacbar
    );
  }
} //class
