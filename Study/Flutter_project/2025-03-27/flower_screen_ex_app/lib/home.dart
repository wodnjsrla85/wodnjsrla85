import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<String> flowerImages;
  late int current;

  @override
  void initState() {
    super.initState();
    flowerImages = [
      'flower_01.png',
      'flower_02.png',
      'flower_03.png',
      'flower_04.png',
      'flower_05.png',
      'flower_06.png',
    ];
    current = 0;
  }

  @override
  Widget build(BuildContext context) {
    //build가 전체를 그려준다.
    final Size screenSize = MediaQuery.of(context).size;
    final double screenWidth = screenSize.width;
    final double screenHeight = screenSize.height;
    //모든 에뮬레이터에서 같은 위치에 같은 위젯을 넣어주기 위해 사이즈를 가지고 온다.
    //화면사이즈 출력
    print('$screenHeight,$screenWidth');
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'images/${flowerImages[current]}',
            height: 874, width: 402,
            fit: BoxFit.fill,
          ),
          Positioned(
            top: 437,
            left: 10,
            child: ElevatedButton(
              onPressed:(){
                prevButton();
              }, 
              child: Text('<<'),
            ),
          ),
          Positioned(
            top: 437,
            right: 10,
            child: ElevatedButton(
              onPressed:(){
                nextButton();
              }, 
              child: Text('>>'),
            ),
          ),
        ]
      ),
    );
  }

  prevButton(){
    current --;
    if(current<0){
      current = flowerImages.length -1 ;
    }
    setState(() {});
  }
  nextButton(){
    current ++;
    if(current>=flowerImages.length){
      current = 0;
    }
    setState(() {});
  }
}
