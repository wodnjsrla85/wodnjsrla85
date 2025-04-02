import 'package:flutter/material.dart';
import 'package:listview_insert_app/model/alert_message.dart';


class AddList extends StatefulWidget {
  const AddList({super.key});

  @override
  State<AddList> createState() => _AddListState();
}

class _AddListState extends State<AddList> {
  late TextEditingController textEditingController;
  late bool checkboxValue;
  late String images;


  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
    checkboxValue = false;
    images = 'images/bee.png';
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: textEditingController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                label: Text('동물 이름'),
              ),
            ),
            Row(
              children: [
              ],
            ),
            Row(
              children: [
                Text('날수있나요?'),
                Checkbox(
                  value: checkboxValue, onChanged: (value) {
                  checkboxValue = value!;

                  checkboxValue == true
                  ? AlertMessage.fly = '가능' 
                  : AlertMessage.fly = '불가능';

                  setState(() {});
                  }
                ),
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => images = 'images/cow.png',
                    child: Image.asset('images/cow.png',width: 100,),
                  ),
                  GestureDetector(
                    onTap: () => images = 'images/pig.png',
                    child: Image.asset('images/pig.png',width: 100,)
                  ),
                  GestureDetector(
                    onTap: () => images = 'images/bee.png',
                    child: Image.asset('images/bee.png',width: 100,)
                  ),
                  GestureDetector(
                    onTap: () => images = 'images/cat.png',
                    child: Image.asset('images/cat.png',width: 100,)
                  ),
                  GestureDetector(
                    onTap: () => images = 'images/fox.png',
                    child: Image.asset('images/fox.png',width: 100,)
                  ),
                ],
              ),
            ),
            Text(textEditingController.text),
            ElevatedButton(
              onPressed: () {
                alertMessage(context);
              }, 
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white
              ),
              child: Text('동물 추가하기'),
            ),
          ],
        ),
      ),
    );
  }
  alertMessage(BuildContext context){
    showDialog(
      context: context, 
      builder: (context) {
        return AlertDialog(
          title: Text('동물 추가하기'),
          content: Text(
            '이동물은${textEditingController.text}입니다. 또 동물의 종류는 파충류 입니다.\n 이동물은 ${AlertMessage.fly}\n 이 동물을 추가하시겠습니까?'
            ),
          actions: [
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    AlertMessage.comment = textEditingController.text;
                    AlertMessage.animalImage = images;
                    AlertMessage.type = '';
                    AlertMessage.fly = '';

                    Navigator.pop(context);
                  }, 
                  child: Text('예'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  }, 
                  child: Text('아니요')
                ),
              ],
            )
          ],
        );
      }
    ,);
    setState(() {});
  }
}