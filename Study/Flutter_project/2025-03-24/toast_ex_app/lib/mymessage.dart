import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyMessage extends StatelessWidget {
  const MyMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () => toastFunction('Toast Message1', ToastGravity.TOP),
                style: ElevatedButton.styleFrom(minimumSize: Size(150, 30)),
                child: Text('Toast Message1'),
              ),
              ElevatedButton(
                onPressed: () => toastFunction("Toast Message2", ToastGravity.BOTTOM),
                style: ElevatedButton.styleFrom(minimumSize: Size(150, 30)),
                child: Text('Toast Message2'),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () => snackBarFunction('SnacBar 1',context),
                style: ElevatedButton.styleFrom(minimumSize: Size(150, 30)),
                child: Text('SnackBar1'),
              ),
              ElevatedButton(
                onPressed: () => snackBarFunction('SnacBar 2',context),
                style: ElevatedButton.styleFrom(minimumSize: Size(150, 30)),
                child: Text('SnackBar2'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  toastFunction(String msg, ToastGravity gravity) {
    Fluttertoast.showToast(msg: msg, gravity: gravity);
  }

  snackBarFunction(String msg,BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(msg),
      duration: Duration(seconds: 1),
      )
    );
  }
}
