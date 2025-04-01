import 'package:flutter/material.dart';

class Pkm66 extends StatefulWidget {
  const Pkm66({super.key});

  @override
  State<Pkm66> createState() => _Pkm66State();
}

class _Pkm66State extends State<Pkm66> {
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
              Text('no.066 알통몬',
              style: TextStyle(fontSize: 40,
              color: Colors.white)),
              Image.asset('images/66.png',height: 200,),
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
                    Text('키 : 0.7m \n몸무게 : 16kg',
                    style: TextStyle(fontSize: 32,
                    color: Colors.white),
                    textAlign: TextAlign.left),
                  ],
                ),
              ),
              Divider(color: Colors.red),
              Text('몸집은 어린아이만 하지만 온몸이 근육으로 되어 있어서 어른 100명은 날려 버릴 수 있다.',
              style: TextStyle(fontSize: 32,
              color: Colors.white),)
            ],
          ),
        ),
      ),
    );
  }
}