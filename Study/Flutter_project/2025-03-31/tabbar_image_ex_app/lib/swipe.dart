

import 'package:flutter/material.dart';
import 'package:simple_gesture_detector/simple_gesture_detector.dart';

class Swipe extends StatefulWidget {
  const Swipe({super.key});

  @override
  State<Swipe> createState() => _SwipeState();
}

class _SwipeState extends State<Swipe> {
  late List<String> images;
  late int current;

  @override
  void initState() {
    super.initState();
    current = 0;
    images = [
      'flower_01.png',
      'flower_02.png',
      'flower_03.png',
      'flower_04.png',
      'flower_05.png',
      'flower_06.png',
    ];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('images/${images[current]}'),
            SimpleGestureDetector(
              onHorizontalSwipe: (direction) {
                swipeImage(direction);
              },
              child: Image.asset('images/${images[current]}', width: 300,)
            ),
          ],
        ),
      ),
    );
  }
  swipeImage(SwipeDirection direction){
    if(direction == SwipeDirection.left){
      current ++;
      if(current >= images.length){
        current = 0;
      }
    }else if(direction == SwipeDirection.right){
      current --;
      if(current < 0){
        current = images.length-1;
      }
    }
    setState(() {});
  }
}