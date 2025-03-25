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
    );
  } //Build

  // ---- Functions ----
  sendFunction(BuildContext context) {
    Navigator.pushNamed(context, '/sendmail');
  }
  recivedFunction(BuildContext context) {
    Navigator.pushNamed(context, '/recivedmail');
  }

  mailFunction(BuildContext context, String part1){
    if(part1 == 'send'){
      Navigator.pushNamed(context, '/sendmail');
    }else{
      Navigator.pushNamed(context, '/recivedmail');
    }
  }
} //Mail
