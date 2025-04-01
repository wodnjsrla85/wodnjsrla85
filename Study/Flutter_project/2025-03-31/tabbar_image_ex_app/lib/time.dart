import 'dart:async';

import 'package:flutter/material.dart';

class Time extends StatefulWidget {
  const Time({super.key});

  @override
  State<Time> createState() => _TimeState();
}

class _TimeState extends State<Time> {
  late List<String> images;
  late int current;
  late Timer _timer;

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

    _timer = Timer.periodic(Duration(seconds: 1), (timer) => changeImage());
  }

  changeImage() {
    current++;
    if (current >= images.length) {
      current = 0;
    }
    setState(() {});
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('images/${images[current]}'),
            Image.asset('images/${images[current]}', width: 300),
          ],
        ),
      ),
    );
  }
}
