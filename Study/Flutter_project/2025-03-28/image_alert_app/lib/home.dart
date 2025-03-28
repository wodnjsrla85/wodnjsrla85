import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String lampImage;

  @override
  void initState() {
    super.initState();
    lampImage = 'images/lamp_on.png';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert를 이용한 메시지 출력'),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 400,
            height: 400,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 100.0),
                child: Image.asset(lampImage, width: 300),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: FilledButton(
                  onPressed: () {
                    lampImage == 'images/lamp_on.png'
                    ? errorMessage(context, true)
                    : turnMessage(context,true);
                  },
                  style: FilledButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                  ),
                  child: Text('켜기'),
                ),
              ),
              FilledButton(
                onPressed: () {
                  lampImage == 'images/lamp_off.png'
                  ? errorMessage(context, false)
                  : turnMessage(context,false);
                },
                style: FilledButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                ),
                child: Text('끄기'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  turnMessage(BuildContext context,bool a) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: a == true
            ? Text('램프 켜기')
            : Text('램프 끄기'),
          content: a == true
          ? Text('램프를 키시겠습니까?')
          : Text('램프를 끄시겠습니까?'),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    a == true
                    ? lampImage = 'images/lamp_on.png'
                    : lampImage = 'images/lamp_off.png';
                    Navigator.pop(context);
                    setState(() {});
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.red,
                  ),
                  child: Text('예'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.red,
                  ),
                  child: Text('아니요'),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
  errorMessage(BuildContext context,bool a){
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: Text('경고'),
          content: lampImage == 'images/lamp_on.png' && a == true
          ?Text('램프는 이미 켜져 있습니다.')
          :Text('램프는 이미 꺼져 있습니다.'),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.red,
                  ),
                  child: Text('네 알겠습니다.'),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

}
