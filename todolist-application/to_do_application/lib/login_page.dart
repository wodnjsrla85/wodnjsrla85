// Login Page 
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:to_do_aplication/model/account.dart';
import 'package:to_do_aplication/model/color_pallete.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Property
  late TextEditingController idController; // id TextField Controller
  late TextEditingController pwController; // pw TextField Controller

  late List<String> loginImage; //Timer로 자동 변경되는 이미지들
  late List<String> currentImage;
  late int current; //이미지의 저장위치를 표시

  @override
  void initState() {
    super.initState();
    idController = TextEditingController();
    pwController = TextEditingController();

    loginImage = [
      'images/login/ytt.png',
      'images/login/mnp.png',
      'images/login/slp.png',
    ];

    currentImage = [
      'images/login/bigtap.png',
      'images/login/smalltap.png',
      'images/login/smalltap.png',
    ];

    current = 0;

    Timer.periodic(Duration(seconds: 2),(timer) => changeImage(),);
  }

  changeImage(){
    current ++;
    if(current >= loginImage.length){
      current = 0;
    } 

    current == 0 
    ? currentImage[0] = 'images/login/bigtap.png'
    : currentImage[0] = 'images/login/smalltap.png';

    current == 1 
    ? currentImage[1] = 'images/login/bigtap.png'
    : currentImage[1] = 'images/login/smalltap.png';

    current == 2 
    ? currentImage[2] = 'images/login/bigtap.png'
    : currentImage[2] = 'images/login/smalltap.png';

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
        
            // Body Top 
            Container(
              width: 402,
              height: 538,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('images/login/background.png')),
                borderRadius: BorderRadius.circular(40)
              ),
              child: Column(
                children: [
                  // Timer Image Change
                  Padding(
                    padding: const EdgeInsets.only(top: 123.0),
                    child: SizedBox(
                      width: 323,
                      height: 300,
                      child: Image.asset(
                        loginImage[current],
                      ),
                    ),
                  ),
                  // Current Image
                  Padding(
                    padding: const EdgeInsets.only(top: 65.0),
                    child: SizedBox(
                      width: 100,
                      height: 20,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(currentImage[0]),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10,0,10,0),
                            child: Image.asset(currentImage[1]),
                          ),
                          Image.asset(currentImage[2]),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Body Bottom 
            // Id TextField
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: 
              SizedBox(
                width: 300,
                height: 50,
                child: TextField(
                  controller: idController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.account_circle_outlined,
                      size: 20,
                      color: ColorPallete.textfieldIconColor,
                    ),
                    filled: true,
                    fillColor: ColorPallete.textfieldColor,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ),
        
            // Pw TextField
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: SizedBox(
                width: 300,
                height: 50,
                child: TextField(
                  controller: pwController,
                  textInputAction: TextInputAction.done,
                  obscureText: true,
                  obscuringCharacter: '*',
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.lock_outline,
                      size: 20,
                      color: ColorPallete.textfieldIconColor,
                    ),
                    filled: true,
                    fillColor: ColorPallete.textfieldColor,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ),
        
            // Login Button
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(300, 50),
                  backgroundColor: ColorPallete.mainColor,
                  foregroundColor: ColorPallete.textMainColor,
                ),
                onPressed: () {
                  login();
                }, 
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontFamily: 'Pretendard',
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                )
              ),
            ),
          ],
        ),
      ),
    );
  }


  login(){
    if(idController.text.trim().isEmpty || pwController.text.trim().isEmpty){
      loginMessage('ID/PW에 공백이 존재합니다.', false);
    }else if(idController.text != Account.id || pwController.text != Account.pw){
      loginMessage('ID/PW가 틀렸습니다', false);
    }else if(idController.text == Account.id && pwController.text == Account.pw) {
      loginMessage('환영합니다. 당신의 하루를 응원합니다.', true);
      Navigator.pushNamed(context, '/1');
    }
  }

  loginMessage(String msg, bool check){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          msg
        ),
        backgroundColor: 
          check == false
          ? Colors.red
          : Colors.green ,
        duration: Duration(seconds: 2),
      )
    );
  }
}