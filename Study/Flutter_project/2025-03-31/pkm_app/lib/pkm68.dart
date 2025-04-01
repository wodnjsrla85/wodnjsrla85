import 'package:flutter/material.dart';

class Pkm68 extends StatefulWidget {
  const Pkm68({super.key});

  @override
  State<Pkm68> createState() => _Pkm68State();
}

class _Pkm68State extends State<Pkm68> {
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
              Text('no.068 괴력몬',
              style: TextStyle(fontSize: 40,
              color: Colors.white)),
              Image.asset('images/68.jpeg',height: 200,),
              Padding(
                padding: const EdgeInsets.only(left:50.0),
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
                    Text('키 : 1.6m \n몸무게 : 130kg',
                    style: TextStyle(fontSize: 32,
                    color: Colors.white),
                    textAlign: TextAlign.left),
                  ],
                ),
              ),
              Divider(color: Colors.red),
              Text('발달한 4개의 팔은 2초 동안 1000번의 펀치를 날릴 수 있다.',
              style: TextStyle(fontSize: 32,
              color: Colors.white),)
            ],
          ),
        ),
      ),
    );
  }
}