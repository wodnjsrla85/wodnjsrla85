import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[100],
        toolbarHeight: 100,
         //AppBar가 작아서 짤려서 안보일땐 Appbar를 키운다
        title: Column(children: [Text('AppBar Icon'), Text('-----------'),Text('-----------')]),
        leading: IconButton(
          //앞쪽에 아이콘 넣는 형태 (앞에 아이콘은 1개만 가능하다)
          onPressed: () {
            //
          },
          icon: Icon(Icons.menu),
        ),
        actions: [
          //뒤쪽에 아이콘 넣는 형태 (뒤에 아이콘은 여러개가 가능하다)
          //아이콘을 title쪽으로 당기기위해 padding 이나 SizedBox사용
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.email),
            color: Colors.red,
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.alarm),
            color: Colors.green,
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add_outlined),
            color: Colors.blue,
          ),
          Padding(//Padding은 위젯들을 다 나열하고 마지막에 
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              //제스처를 감지한다.
              onTap: () {
                //tap했을떄 기능
                print('smile image is tapped.');
              },
              child: Image.asset(
                //기능을 하는 것은 touchscreen에서 이루어지고 그 기능들은 gesture로 파악한다.
                'images/smile.png',
                width: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
