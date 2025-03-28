import 'package:flutter/material.dart';
import 'package:simple_gesture_detector/simple_gesture_detector.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //property
  late List<String> imageName;
  late int currentImage; //[currentImage]

  @override
  void initState() {
    super.initState();

    imageName = [
      'flower_01.png',
      'flower_02.png',
      'flower_03.png',
      'flower_04.png',
      'flower_05.png',
      'flower_06.png',
    ];

    currentImage = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Image Swiping')),
    body: SimpleGestureDetector(
      onHorizontalSwipe: (direction) => _onHorizontalSwipe(direction), //direction이 오른쪽으로 밀었는지 왼쪽으로 밀었는지 저장하고 있다.
      onVerticalSwipe: (direction) => _onVerticalSwioe(direction),
      onDoubleTap: () => _onDoubleTap(), //방향이 없어서 direction을 사용안함
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              imageName[currentImage],
            ),
            Image.asset(
              'images/${imageName[currentImage]}',
              width: 350,
            ),
          ],
        ),
      ),
    ),
    
    
    );
  }
  _onHorizontalSwipe(SwipeDirection direction){
    if(direction == SwipeDirection.left){ //right to left
      currentImage ++;
      if(currentImage >= imageName.length){
        currentImage = 0;
      }
    }else{ //left to right
      currentImage --;
      if(currentImage < 0){
        currentImage = imageName.length-1;
      }
    }
    setState(() {});
  }

  _onVerticalSwioe(SwipeDirection direction){
    if(direction == SwipeDirection.up){ //down to up
      currentImage ++;
      if(currentImage >= imageName.length){
        currentImage = 0;
      }
    }else{
      currentImage --;
      if(currentImage < 0){
        currentImage = imageName.length-1;
      }
    }
    setState(() {});
  }

  _onDoubleTap(){
    currentImage ++;
    if(currentImage >= imageName.length){
      currentImage = 0;
    }
    setState(() {});
  }
}
