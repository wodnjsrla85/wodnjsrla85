import 'dart:async';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
// bool, double 변수 가지고 완성하기
  late bool switchValue;
  late double imageSize;
  late int rotation;
  @override
  void initState() {
    super.initState();
    switchValue = false; //초기값을 꺼진걸로
    imageSize = 300; //초기값을 큰값으로
    rotation = 0;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('image 확대 및 축소'),
        foregroundColor: Colors.white,
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox( 
              //SizeBox는 child라 child에 있는 위젯이 독식하는데 그걸 방지하기 위해 Coloumn,Center,Row들(children)위젯들로 먼저 덮는다
              width: 500,
              height: 500,
              child: Center(
                child:
                    // String변수를 사용 못하기때문에 삼항연산자를 이용해서 꺼졌을때 켜졌을때 사용
                    RotationTransition(
                      turns: AlwaysStoppedAnimation(rotation/360),
                      child: Image.asset(
                        switchValue == false
                        ? 'images/lamp_off.png'
                        : 'images/lamp_on.png',
                        width: imageSize,
                      ),
                    )
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () => sizeChange(), //사이즈를 비교해서 값을 바꿔주는
                  child:
                      //축소 확대 텍스트를 Size값으로 비교해서 
                      imageSize == 300
                          ? Text('축소', style: TextStyle(color: Colors.red))
                          : Text('확대', style: TextStyle(color: Colors.red)),
                ),
                Column(
                  children: [
                    Text(
                      '전구스위치',
                      style: TextStyle(fontSize: 10),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15.0),
                      child: Switch(
                        value: switchValue,
                        onChanged: (value) {
                          switchValue = value;
                          //이미 삼항연산자로 변경을 하기때문에 여기서는 setState로 변경값만 반영해주기
                          setState(() {});
                        },
                        activeColor: Colors.red,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  //사이즈가 크면 작은값으로 아니면 큰값으로 바꿔준다.
  sizeChange() {
    if (imageSize == 200) {
      imageSize = 300;
    } else if (imageSize == 300) {
      Timer.periodic(Duration(milliseconds: 10), (timer) => turnRightImage(),);
      imageSize = 200;
    }


    setState(() {});
  }

  turnRightImage(){
    if(rotation==360 || imageSize == 300){
      rotation = 0;
    }else{
      rotation += 1;
    }
    setState(() {});
  }
}
