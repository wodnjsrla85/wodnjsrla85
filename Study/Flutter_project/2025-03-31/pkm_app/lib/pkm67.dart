import 'package:flutter/material.dart';

class Pkm67 extends StatefulWidget {
  const Pkm67({super.key});

  @override
  State<Pkm67> createState() => _Pkm67State();
}

class _Pkm67State extends State<Pkm67> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
        child: Container(
          color: Colors.black,
          child: Column(
            children: [
              Text('no.067 근육몬',
              style: TextStyle(fontSize: 40,
              color: Colors.white)),
              Image.asset('images/67.webp',height: 200,),
              Padding(
                padding: const EdgeInsets.only(left: 50.0),
                child: Row(
                  children: [
                    Text('괴력포켓몬',
                    style: TextStyle(fontSize: 40,
                    color: Colors.white),
                    textAlign: TextAlign.left),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50.0),
                child: Row(
                  children: [
                    Text('키 : 1.5m \n몸무게 : 70kg',
                    style: TextStyle(fontSize: 32,
                    color: Colors.white),
                    textAlign: TextAlign.left),
                  ],
                ),
              ),
              Divider(color: Colors.red),
              Text('지칠 줄 모르는 강인한 육체를 가졌다. 무거운 짐 운반하기 등의 일을 돕는다.',
              style: TextStyle(fontSize: 32,
              color: Colors.white),)
            ],
          ),
        ),
      ),
    );
  }
}