import 'package:flutter/material.dart';
import 'package:listview_todo_app/model/message.dart';

class InsertList extends StatefulWidget {
  const InsertList({super.key});

  @override
  State<InsertList> createState() => _InsertListState();
}

class _InsertListState extends State<InsertList> {
  late TextEditingController textEditingController;
  late bool switch1Value;
  late bool switch2Value;
  late bool switch3Value;


  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
    switch1Value = true;
    switch2Value = false;
    switch3Value = false; 
  }

  @override
  Widget build(BuildContext context) {

    if(switch1Value == false && switch2Value == false && switch3Value == false){
      switch1Value = true;
      Message.imagePath = 'images/cart.png';
    }

    return Scaffold(
      appBar: AppBar(title: Text('Add view')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('구매'),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Switch(
                      value: switch1Value,
                      onChanged: (value) {
                        switch1Value = value;

                        switch1Value == true
                        ? {switch2Value = false , switch3Value = false , Message.imagePath = 'images/cart.png'}
                        : switch1Value = false;

                        setState(() {});
                      },
                    ),
                  ),
                  Image.asset('images/cart.png', width: 40),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('약속'),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Switch(
                      value: switch2Value,
                      onChanged: (value) {
                        switch2Value = value;

                        switch2Value == true
                        ? {switch1Value = false , switch3Value = false , Message.imagePath = 'images/clock.png'}
                        : switch2Value = false;
                        
                        setState(() {});
                      },
                    ),
                  ),
                  Image.asset('images/clock.png', width: 40),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('스터디'),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Switch(
                        value: switch3Value,
                        onChanged: (value) {
                          switch3Value=value;

                          switch3Value == true
                        ? {switch2Value = false , switch1Value = false , Message.imagePath = 'images/pencil.png'}
                        : switch3Value = false;
                          setState(() {});
                        },
                      ),
                    ),
                    Image.asset('images/pencil.png', width: 30),
                  ],
                ),
              ),
              TextField(
                controller: textEditingController,
                decoration: InputDecoration(labelText: '목록을 입력하세요'),
                keyboardType: TextInputType.text,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (textEditingController.text.trim().isNotEmpty) {
                      //같은 리스트를 여러개의 파일에서 사용하면 관리가 안된다. 데이터는 한놈이 다 관리 해야한다.
                      addList();
                      Navigator.pop(context);
                    }else{
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('입력칸이 공백 입니다.'),
                          backgroundColor: Colors.red,
                          duration: Duration(seconds: 1),
                        )
                      );
                      setState(() {});
                    }
                  },
                  child: Text('OK'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  addList() {
    Message.workList = textEditingController.text;
    Message.action = true;
    setState(() {});
  }

}
