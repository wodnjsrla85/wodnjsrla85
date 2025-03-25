import 'package:flutter/material.dart';

class Mail extends StatelessWidget {
  const Mail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigator_Appbar', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
        actions: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: IconButton(
              onPressed: () => mailFunction(context, 'send'),
              icon: Icon(Icons.email),
              color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: IconButton(
              onPressed:() => mailFunction(context, 'recived'),
              icon: Icon(Icons.email_outlined),
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton(
              onPressed: () => sendFunction(context),
              style: FilledButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                minimumSize: Size(150, 40),
              ),
              child: Text('SendMail'),
            ),
            FilledButton(
              onPressed:
                  () => recivedFunction(context),
              style: FilledButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                minimumSize: Size(150, 40),
              ),
              child: Text('recivedmail'),
            ),
          ],
        ),
      ),
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
              leading: Icon(Icons.mail,color: Colors.blue,),
              title: Text('Send Mail'),
              onTap: () => sendFunction(context),
            ),
            ListTile(
              leading: Icon(Icons.mail_outline,color: Colors.red,),
              title: Text('Recived Mail'),
              onTap: () => recivedFunction(context),
            ),
          ],
        ),
      ),
    );
  } //Build

  // ---- Functions ----
  sendFunction(BuildContext context) {
    Navigator.popAndPushNamed(context, '/sendmail');
  }
  recivedFunction(BuildContext context) {
    Navigator.popAndPushNamed(context, '/recivedmail');
  }

  mailFunction(BuildContext context, String part1){
    if(part1 == 'send'){
      Navigator.popAndPushNamed(context, '/sendmail');
    }else{
      Navigator.popAndPushNamed(context, '/recivedmail');
    }
  }
} //Mail
