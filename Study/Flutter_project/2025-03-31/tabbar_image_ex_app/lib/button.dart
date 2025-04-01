import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  const Button({super.key});

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
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
            Image.asset('images/${images[current]}', width: 300,),
            Padding(
              padding: const EdgeInsets.only(top:30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right:20.0),
                    child: ElevatedButton(
                      onPressed: () {
                        prevImage();
                      }, 
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber,
                        foregroundColor: Colors.black,
                      ),
                      child: Text('이전'),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      nextImage();
                    }, 
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                      foregroundColor: Colors.black,
                    ),
                    child: Text('다음'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  prevImage(){
    current --;
    if(current < 0 ){
      current = images.length-1;
    }

    setState(() {});
  }
  nextImage(){
    current ++;

    if(current >= images.length ){
      current = 0;
    }
    setState(() {});
  }
}