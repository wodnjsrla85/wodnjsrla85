import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late TextEditingController idController;
  late TextEditingController pwController;

  late String answerID;
  late String answerPW;

  @override
  void initState() {
    super.initState();
    idController = TextEditingController();
    pwController = TextEditingController();

    answerID = '12345';
    answerPW = '12345';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: [
              Icon(Icons.account_circle, size: 200,color: Colors.blue,),
              TextField(
                controller: idController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(label: Text('ID를 입력하세요')),
              ),
              TextField(
                controller: pwController,
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: InputDecoration(label: Text('비밀번호를 입력하세요')),
              ),
              Padding(
                padding: const EdgeInsets.only(top:30.0),
                child: ElevatedButton(onPressed: () => loginDialog(), child: Text('로그인')),
              ),
            ],
          ),
        ),
      ),
    );
  }

  loginDialog() {
    if (idController.text == answerID && pwController.text == answerPW) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('로그인'),
            content: Text('로그인 성공하셨습니다.'),
            actions: [
              ElevatedButton(
                onPressed: () => Navigator.popAndPushNamed(context, '/1'),
                child: Text('네'),
              ),
            ],
          );
        },
      );
    }else{
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('로그인 실패'),
            content: Text('아이디와 패스워드를 확인하세요'),
            actions: [
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('네'),
              ),
            ],
          );
        },
      );

    }
    setState(() {});
  }
}
