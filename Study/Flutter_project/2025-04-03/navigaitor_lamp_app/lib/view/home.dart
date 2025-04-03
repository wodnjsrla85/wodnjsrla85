import 'package:flutter/material.dart';
import 'package:navigaitor_lamp_app/model/message.dart';
import 'package:navigaitor_lamp_app/view/controller.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late TextEditingController textEditingController;
  late String lampImage;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
    lampImage = 'images/lamp_on.png';
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main 화면'),
        actions: [
          IconButton(
            onPressed: () {
              Message.content = textEditingController.text;
              Message.lampStatus = true;
              //데이터를 넘길려고 저장소에 데이터 저장
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => Controller(),
                  //넘어갈때 데이터를 가지고 가야한다. static 저장소 사용
                ),
              ).then((value) => getData(),);
            }, 
            icon: Icon(Icons.edit),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //TextField
            TextField(
              controller: textEditingController,
              decoration: InputDecoration(
                labelText: '글자를 입력하세요',
              ),
            ),
            //Image
            Image.asset(
              lampImage,
              width: 150,
            )
          ],
        ),
      ),
    );
  }
  getData(){
    textEditingController.text = Message.content;
    if(Message.lampStatus == true){
      lampImage = 'images/lamp_on.png';
    }else{
      lampImage = 'images/lamp_off.png';
    }

    setState(() {});
  }

}