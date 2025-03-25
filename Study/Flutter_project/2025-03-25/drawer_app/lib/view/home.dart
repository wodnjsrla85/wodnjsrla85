import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawr은 scaffold가 가지고 있다.
      appBar: AppBar(
        centerTitle: true,
        title: Text('Drawer'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart)),
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
        ],
      ),
      body: Center(child: Text('Drawer')),
      drawer: Drawer(
        //leading에 버튼을 만들어서 하는게 아니라 따로 drawer을 생성 시키면 자동으로 버튼 생성
        child: ListView(
          //view들을 순서대로 하나씩 List형태로 갖는것
          padding:
              EdgeInsets.zero, //user AccountsDrawerHeader에 Padding을 없애서 시스템화면까지 색상을 변경 할 수 있다.
          children: [
            UserAccountsDrawerHeader(
              //flutter에서 정해져있는 기본 사진,이름,이메일을 정의하는것
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('images/pikachu-1.jpg'),
              ),
              otherAccountsPictures: [
                CircleAvatar(
                  backgroundImage: AssetImage('images/pikachu-1.jpg'),
                ),
                CircleAvatar(
                  backgroundImage: AssetImage('images/pikachu-1.jpg'),
                ),
              ],
              accountName: Text('Pikachu'),
              accountEmail: Text('pikachu@naver.com'),
              decoration: BoxDecoration(
                //스타일을 바꾸는것
                color: Colors.red,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                print('Home is clicked');
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('설정'),
              onTap: () {
                print('설정 is clicked');
              },
            ),
            ListTile(
              leading: Icon(Icons.question_answer, color: Colors.red,),
              title: Text('자주 묻는 질문'),
              onTap: () {
                print('자주묻는질문 is clicked');
              },
            ),
          ],
        ),
      ),
    );
  }
}
