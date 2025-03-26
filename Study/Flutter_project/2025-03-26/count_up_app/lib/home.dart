import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late int count; //버튼 입력 횟수

  @override
  void initState() {
    super.initState();
    count = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Count Up')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text('버튼 클릭 횟수 : $count'),
            ),
            GestureDetector(
              onLongPress: () {
                count = 0;
                setState(() {});
              },
              child: FloatingActionButton( //body안에서 사용한 floatingactionbutton 이뒤에 글이 있으면 깨진다.
                onPressed: () => addCount(),
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                child: Icon(Icons.add),
              ),
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => addCount(),
      //   backgroundColor: Colors.red,
      //   foregroundColor: Colors.white,
      //   child: Icon(Icons.add),
      // ),
      floatingActionButton: ElevatedButton(
        onPressed: () => addCount(),
        child: Text('Add'),
      ),
    );
  }

  addCount() {
    count += 1;
    setState(() {});
  }
}
