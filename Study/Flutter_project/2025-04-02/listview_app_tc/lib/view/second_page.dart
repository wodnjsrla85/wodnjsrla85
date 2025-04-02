import 'package:flutter/material.dart';
import 'package:listview_app_tc/model/animal_list.dart';

class SecondPage extends StatefulWidget {
  final List<Animal> list;

  const SecondPage({super.key, required this.list});


  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  // property
  late TextEditingController nameController; //동물이름 작성
  late int radioValue; // Radio Button
  late bool flyExist; // CheckBox
  late String imagePath; // Image 선택
  late String imageName; // Image 이름

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    radioValue = 0;
    flyExist = false;
    imagePath = "";
    imageName = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: nameController,
              keyboardType: TextInputType.text,
              maxLines: 1, //한줄이상 못쓰게 하는거
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Radio Button
                Radio(
                  value: 0, //레디오 버튼의 고유 넘버 
                  groupValue: radioValue, //그룹값
                  onChanged: (value) => radioChange(value),
                ),
                Text('양서류'),

                Radio(
                  value: 1, //레디오 버튼의 고유 넘버 
                  groupValue: radioValue, //그룹값
                  onChanged: (value) => radioChange(value),
                ),
                Text('파충류'),

                Radio(
                  value: 2, //레디오 버튼의 고유 넘버 
                  groupValue: radioValue, //그룹값
                  onChanged: (value) => radioChange(value),
                ),
                Text('포유류'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('날 수 있나요?'),
                Checkbox(
                  value: flyExist, 
                  onChanged: (value) {
                    flyExist = value!;
                    setState(() {});
                  },
                ),
              ],
            ),
            SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  GestureDetector(
                    onTap: () {
                      imagePath = 'images/cow.png';
                      imageName = '젖소';
                      setState(() {});
                    },
                    child: Image.asset('images/cow.png',width: 80,),
                  ),
                  GestureDetector(
                    onTap: () {
                      imagePath = 'images/pig.png';
                      imageName = '돼지';
                      setState(() {});
                    },
                    child: Image.asset('images/pig.png',width: 80,),
                  ),
                  GestureDetector(
                    onTap: () {
                      imagePath = 'images/bee.png';
                      imageName = '벌';
                      setState(() {});
                    },
                    child: Image.asset('images/bee.png',width: 80,),
                  ),
                  GestureDetector(
                    onTap: () {
                      imagePath = 'images/fox.png';
                      imageName = '여우';
                      setState(() {});
                    },
                    child: Image.asset('images/fox.png',width: 80,),
                  ),
                  GestureDetector(
                    onTap: () {
                      imagePath = 'images/monkey.png';
                      imageName = '원숭이';
                      setState(() {});
                    },
                    child: Image.asset('images/monkey.png',width: 80,),
                  ),
                  GestureDetector(
                    onTap: () {
                      imagePath = 'images/cat.png';
                      imageName = '고양이';
                      setState(() {});
                    },
                    child: Image.asset('images/cat.png',width: 80,),
                  ),
                  GestureDetector(
                    onTap: () {
                      imagePath = 'images/dog.png';
                      imageName = '강아지';
                      setState(() {});
                    },
                    child: Image.asset('images/dog.png',width: 80,),
                  ),
                  GestureDetector(
                    onTap: () {
                      imagePath = 'images/wolf.png';
                      imageName = '늑대';
                      setState(() {});
                    },
                    child: Image.asset('images/wolf.png',width: 80,),
                  ),
                ],
              ),
            ),
            Text(imageName),
            ElevatedButton(
              onPressed: () => _showDialog(), 
              child: Text('동물 추가하기'),
            ),
          ],
        ),
      ),
    );
  }
  radioChange(int? value){
    //위에 radio버튼에서의 value 값이 int?이기 때문에 int?로 선언 
    radioValue = value!; //?는 !로 해제한다.
    setState(() {});
  }

  _showDialog(){
    //타입이 여러개니깐 var로 추론하게 선언
    var animal = Animal(
      imagePath: imagePath, 
      animalName: nameController.text, 
      kind: getKind(radioValue), 
      flyExist: flyExist
    );

    showDialog(
      context: context, 
      builder: (context) {
        return AlertDialog(
          title: Text(
            '동물 추가하기',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            '이 동물은 ${animal.animalName} 입니다. \n'
            '또 동물의 종류는 ${animal.kind} 입니다. \n'
            '이 동물은 ${animal.flyExist == true ? "날 수 있습니다" : "날 수 없습니다."} \n'
            '이 동물을 추가 하시겠습니까?'
          ),
          actions: [
            TextButton(
              onPressed: () {
                //생성자로 생성한 animal을 추가 시키면 된다.
                widget.list.add(animal);
                Navigator.of(context).pop();
              }, 
              child: Text('예'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              }, 
              child: Text('아니요'),
            ),
          ],
        );
      },
    );
  }
  //Radio버튼이 뭘 선택했냐에 따라 값 반환
  String getKind(int radioValue){
    String returnValue='';
    switch(radioValue){
      case 0 : returnValue = '양서류';
      case 1 : returnValue = '파충류';
      case 2 : returnValue = '포유류';
    }
    return returnValue;
  }

}