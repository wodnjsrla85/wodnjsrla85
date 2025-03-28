import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<String> images;
  late int imageIndex;

  @override
  void initState() {
    super.initState();
    images = [
      'flower_01.png',
      'flower_02.png',
      'flower_03.png',
      'flower_04.png',
      'flower_05.png',
      'flower_06.png',
    ];
    imageIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('무한 이미지 반복'),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('images/${images[imageIndex]}'),
            Image.asset('images/${images[imageIndex]}', width: 400),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => beforeImage(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                  ),
                  child: Text('<<이전'),
                ),
                SizedBox(width: 30,),
                ElevatedButton(
                  onPressed: () => afterImage(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                  ),
                  child: Text('다음>>'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  beforeImage() {
    imageIndex--;
    if (imageIndex <= 0) {
      imageIndex = images.length-1;
    }
    setState(() {});
  }

  afterImage() {
    imageIndex++;
    if (imageIndex >= images.length) {
      imageIndex = 0;
    }
    setState(() {});
  }
}
