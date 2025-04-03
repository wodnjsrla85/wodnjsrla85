import 'package:flutter/material.dart';
import 'package:navigaitor_lamp_app/model/message.dart';

class Controller extends StatefulWidget {
  const Controller({super.key});

  @override
  State<Controller> createState() => _ControllerState();
}

class _ControllerState extends State<Controller> {
  late TextEditingController textEditingController;
  late String switchLabel;
  late bool switchValue;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
    textEditingController.text = Message.content;

    if(Message.lampStatus == true){
      switchLabel = 'On';
      switchValue = true;
    }else{
      switchLabel = 'Off';
      switchValue = false;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('수정화면'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: textEditingController,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(switchLabel),
                Switch(
                  value: switchValue, 
                  onChanged: (value) {
                    switchValue = value;
                    if(switchValue == true){
                      switchLabel = 'On';
                    }else{
                      switchLabel = 'Off';
                    }
                    setState(() {});
                  },
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                Message.content = textEditingController.text;
                Message.lampStatus = switchValue;
                Navigator.pop(context);
              }, 
              child: Text('OK'),
            ),
          ],
        ),
      ),
    );
  }
}