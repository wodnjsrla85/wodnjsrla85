import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_intro_app/second_page.dart';
//get의 모든 기능을 사용 가능

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GetX'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Navigation'),
            ElevatedButton(
              onPressed: () => Get.to(SecondPage()), 
              child: Text('Get.to():화면이동'),
              // get을 이용한 기본 화면이동
            ),
            ElevatedButton(
              onPressed: () => Get.toNamed('/third'), 
              child: Text('Get.toNamed():화면 이동'),
              // get을 이용한 Route 이동 *Route를 만들어줘야한다.
            ),
            Divider(
              thickness: 0.5,
              color: Colors.black,
            ),
            Text('Snack Bar'),
            ElevatedButton(
              onPressed: () => buttonSnack(), 
              child: Text('SnackBar보이기'),
              //get을 이용한 snackbar
            ),
            Divider(
              thickness: 0.5,
              color: Colors.black,
            ),
            Text('Dialog'),
            ElevatedButton(
              onPressed: () => buttonDialog(), 
              child: Text('Dialog보이기'),
              // get을 이용한 Dialog
            ),
            Divider(
              thickness: 0.5,
              color: Colors.black,
            ),
            Text('Bottom Sheet'),
            ElevatedButton(
              onPressed: () => buttonBottomSheet(), 
              child: Text('Bottom Sheet보이기'),
              //get을 이용한 Bottom Sheet
            ),
            Divider(
              thickness: 0.5,
              color: Colors.black,
            ),
            Text('Screen Transition'),
            //화면이동할때 효과
            ElevatedButton(
              // get to
              onPressed: () {
                Get.to(
                  SecondPage(),
                  transition: Transition.downToUp,
                  // 화면 이동 효과
                  duration: Duration(seconds: 5),
                  //전환 속도
                );
              }, 
              child: Text('Get.to() : Transition')
            ),
            ElevatedButton(
              onPressed: () => Get.toNamed('/third2'),
              child: Text('Get.toName() : Transition')

              //traisition은 route설정시 준다.
            ),
            Divider(
              thickness: 0.5,
              color: Colors.black,
            ),
            Text('Navigation & Arguments'),
            //화면이동시 static사용안하고 데이터 가지고 오기
            ElevatedButton(
              onPressed: () => Get.to(
                SecondPage(),
                arguments: 'First',
              ), 
              child: Text('Get.to(): Single Arguments'),
              //Constructor 대신
            ),
            ElevatedButton(
              onPressed: () => Get.to(
                SecondPage(),
                arguments: ['Firt','Second'],
                //List형태로 Arguments를 여러개 보낼 수 있다.
              ), 
              child: Text('Get.to(): Multiple Arguments'),
              //Constructor 대신
            ),
            ElevatedButton(
              //뒤에 화면에서 앞으로 데이를 보낼 수 있다.
              onPressed: () async {
                var returnValue = await Get.to(SecondPage());
                //값을 받아야 하기 때문에 사용 *값이 넘어와야 하기때문에 SecondPage가 끝나야 하니깐 await사용
                Get.snackbar(
                  'Return Value', 
                  returnValue,
                );
              },//.then은 여기 있기 떄문에 값을 못받는다. 그러기위해 async 사용
              child: Text('Get.to(): Return Arguments'),
              //Constructor 대신
            ),
          ],
        ),
      ),
    );
  }
  buttonSnack(){
    Get.snackbar(
      'Snack Bar', 
      //title
      'Message',
      //message
      snackPosition: SnackPosition.TOP,
      //snackbar위치 
      duration: Duration(seconds: 2),
      //Duration
      backgroundColor: Colors.red,
      //배경색
      colorText: Colors.white,
      //글자색상
    );
    //get을 이용한 스낵바 보이기 ios 초기값은 위에서 내려온다.
  }

  buttonDialog(){
    Get.defaultDialog(
      title: 'Dialog',
      middleText: 'Message',
      backgroundColor: Colors.amberAccent,
      barrierDismissible: false,
      actions: [
        TextButton(
          onPressed: () => Get.back(),
          // get을 이용한 Navigator.pop 
          child: Text('Exit'),
        )
      ]
    );
  }

  buttonBottomSheet(){
    Get.bottomSheet(
      Container(
        //공간을 보게 하기 위해 container 사용
        width: 500,
        height: 300,
        color: Colors.purple[50],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,  
          children: [
            Text('Text Line1'),
            Text('Text Line2'),
          ],
        ),
      )
    );
  }
}