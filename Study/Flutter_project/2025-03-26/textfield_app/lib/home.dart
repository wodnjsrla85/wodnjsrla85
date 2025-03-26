import 'package:flutter/material.dart';

//함수 하나로 해보기
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Property
  late TextEditingController
  textEditingController; //textfield 를 위한 변수 textfield 하나당 textfieldcontrollwer하나

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController(); //생성자로 설정
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //키보드에 따라 입력을 다해도 키보드가 안내려가는 키보드가 있어서 그걸 지정해줘야한다.
      onTap: () => FocusScope.of(context).unfocus(), //Scaffold의 아무데나를 누르면 키보드가 내려가는것.
      child: Scaffold(
        appBar: AppBar(
          title: Text('Single Textfield', style: TextStyle(color: Colors.white)),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              TextField(
                //텍스트필드를 컨트롤 하는게 텍스트에디팅컨트롤러
                controller:
                    textEditingController, //컨트롤러 지정 *키보드가 안올라올 경우 시뮬레이터에서 cmd+k
                decoration: InputDecoration(
                  //꾸미기
                  labelText: '내용을 입력하세요', //입력창 위에 써지는 Text *사용 안했을때는 안에 있음
                  border: OutlineInputBorder(), //textfield에 테두리 생성
                  enabledBorder: OutlineInputBorder( //입력중이 아닐때 테두리색
                    borderSide: BorderSide(color: Colors.red)
                  ),
                  focusedBorder: OutlineInputBorder( //입력중일때 테두리색
                    borderSide: BorderSide(color: Colors.blue)
                  ),
                ),
                keyboardType: TextInputType.text,
                //.text가 기본 키보드  .number는 숫자용 .emailAddress는 이메일용
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ElevatedButton(
                  onPressed: () => checkData(),
                  child: Text('출력'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  checkData() {
    if (textEditingController.text.trim().isEmpty) {
      //텍스트필드에 값이 들어있는지 확인 *.trim()은 앞뒤 공백제거 *.isEmpty는 비어져있냐?
      // Error Message snackbar로 줄거다
      showingSnackBar('내용을 입력 하세요!',Colors.red,2);
    } else {
      //보이는 메세지 출력
      showingSnackBar('입혁하신 내용은 ${textEditingController.text} 입니다.', Colors.blue, 3);
    }
  }

  // 에러출력과 입력받은값 출력을 동시에 하나로 합춘 함수
  showingSnackBar(String msg,Color color,int time){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg, style: TextStyle(color: Colors.white)),
        duration: Duration(seconds: time),
        backgroundColor: color,
      ),
    );
  }


  // 에러 메세지 출력하는 함수
  errorSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('내용을 입력 하세요!', style: TextStyle(color: Colors.white)),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      ),
    );
  }
  
  // 입력한 메세지 출력하는 함수
  showSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('입혁하신 내용은 ${textEditingController.text} 입니다.', style: TextStyle(color: Colors.white)),
        duration: Duration(seconds: 3),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
