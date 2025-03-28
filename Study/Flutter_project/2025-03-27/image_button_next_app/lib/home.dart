import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //property
  late List<String> imageFiles;
  late int currentPage;
  late int nextPage;

  @override
  void initState() {
    super.initState();

    imageFiles = [
      //final을 적으면 못바꾸게 하는 거
      'flower_01.png',
      'flower_02.png',
      'flower_03.png',
      'flower_04.png',
      'flower_05.png',
      'flower_06.png',
    ];

    currentPage = 0;
    nextPage = 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('무한 이미지 반복')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              imageFiles[currentPage],
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            Stack(
              //z축 정렬을 시켜주는 widget
              children: [
                Container(
                  //테두리를 표시해주기위해
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue, width: 10),
                  ),
                  child: Image.asset(
                    //Conatiner 위에 Image.asset이 있다.
                    'images/${imageFiles[currentPage]}',
                    fit: BoxFit.fill,
                    width: 400,
                    height: 600,
                  ),
                ),
                Positioned(
                  //위치를 이동시킬려고 쓰는 widget
                  left: 282, //왼쪽으로 이동할 값 *값을 이런식으로 주면 에뮬레이터가 바뀔때 마다 다르게 줘야한다.
                  top: 10, //오른쪽으로 이동할 값
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.amber, width: 5),
                    ),
                    child: Image.asset(
                      //기본좌표는 0,0
                      'images/${imageFiles[nextPage]}',
                      fit: BoxFit.fill,
                      width: 100,
                      height: 150,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    prevButton();
                  },
                  child: Text('<<이전'),
                ),
                ElevatedButton(
                  onPressed: () {
                    nextButton();
                  },
                  child: Text('다음>>'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  prevButton() {
    currentPage--;
    if (currentPage < 0) {
      currentPage = imageFiles.length - 1;
    }

    nextPage--;
    if (nextPage < 0) {
      nextPage = imageFiles.length - 1;
    }

    setState(() {});
  }

  nextButton() {
    currentPage++;
    if (currentPage >= imageFiles.length) {
      currentPage = 0;
    }

    nextPage++;
    if (nextPage >= imageFiles.length) {
      nextPage = 0;
    }
    setState(() {});
  }
}
