import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late TextEditingController num1;  //숫자1 (키보드는 숫자)
  late TextEditingController num2;  //숫자2 (키보드는 숫자)

  late TextEditingController add; //덧셈결과 (읽기만 가능)
  late TextEditingController min; //뺄셈결과 (읽기만 가능)
  late TextEditingController mul; //곱셈결과 (읽기만 가능)
  late TextEditingController div; //나눗셈결과 (읽기만 가능)

  @override
  void initState() {
    super.initState();
    num1 = TextEditingController();
    num2 = TextEditingController();

    add = TextEditingController();
    min = TextEditingController();
    mul = TextEditingController();
    div = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('간단한 계산기', style: TextStyle(color: Colors.white)),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: TextField(
                    controller: num1,
                    decoration: InputDecoration(labelText: '첫번째 숫자를 입력하세요',focusedBorder: OutlineInputBorder( //입력중일때 테두리색
                        borderSide: BorderSide(color: Colors.blue)),),
                    keyboardType: TextInputType.number,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: TextField(
                    controller: num2,
                    decoration: InputDecoration(labelText: '두번째 숫자를 입력하세요',focusedBorder: OutlineInputBorder( //입력중일때 테두리색
                        borderSide: BorderSide(color: Colors.blue)),),
                    keyboardType: TextInputType.number,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () => claculate(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text('계산하기', style: TextStyle(color: Colors.white)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: ElevatedButton(
                        onPressed: () => {num1.text = '', num2.text = '',add.text = '', min.text='',mul.text = '',div.text=''},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text('지우기', style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ],
                ),
                TextField(
                  readOnly: true, //읽기만하게 해서 키보드가 아나온다.₩
                  controller: add,
                  decoration: InputDecoration(labelText: '덧셈결과'),
                ),
                TextField(
                  readOnly: true,
                  controller: min,
                  decoration: InputDecoration(labelText: '뺄셈결과'),
                ),
                TextField(
                  readOnly: true,
                  controller: mul,
                  decoration: InputDecoration(labelText: '곱셈결과'),
                ),
                TextField(
                  readOnly: true,
                  controller: div,
                  decoration: InputDecoration(labelText: '나눗셈결괴'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  claculate() {
    if (num1.text.trim().isEmpty || num2.text.trim().isEmpty) {
      errorSnackbar();
    } else {
      add.text = (int.parse(num1.text)+int.parse(num2.text)).toString();
      min.text = (int.parse(num1.text)-int.parse(num2.text)).toString();
      mul.text = (int.parse(num1.text)*int.parse(num2.text)).toString();
      div.text = (double.parse(num1.text)/double.parse(num2.text)).toString();
    }
  }

  errorSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('값을 입력하세요'),backgroundColor: Colors.red,duration: Duration(seconds: 1)),
    );
  }
}
