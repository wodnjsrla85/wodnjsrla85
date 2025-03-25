import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String buttonText;
  late Color buttonColor;
  late double imageSize;
  late String changeImage;

  @override
  void initState() {
    super.initState();
    buttonText = 'Flutter';
    buttonColor = Colors.blue;
    imageSize = 100;
    changeImage = 'images/a.jpg';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Change button color & text',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: false,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(changeImage, width: imageSize),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FilledButton(
                  onPressed: () => clickButton(),
                  style: FilledButton.styleFrom(
                    backgroundColor: buttonColor,
                    foregroundColor: Colors.white,
                  ),
                  child: Text(buttonText),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FilledButton(
                    onPressed: () => imageSizeChange('+'),
                    onLongPress: () => sizeZero(),
                    style: FilledButton.styleFrom(backgroundColor: Colors.red),
                    child: Text('+'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FilledButton(
                    onPressed: () => imageSizeChange('-'),
                    onLongPress: () => sizeZero(),
                    style: FilledButton.styleFrom(backgroundColor: Colors.green),
                    child: Text('-'),
                  ),
                ),
                FilledButton(
                  onPressed: () => ChangeImage(),
                  style: FilledButton.styleFrom(backgroundColor: Colors.green),
                  child: Text('changeImage'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  clickButton() {
    buttonText == 'Flutter'
        ? {buttonText = 'Dart', buttonColor = Colors.amber}
        : {buttonText = 'Flutter', buttonColor = Colors.blue};

    setState(() {});
  }

  imageSizeChange(String part) {
    part == '+' ? imageSize += 10 : imageSize -= 10;
    setState(() {});
  }

  ChangeImage() {
    changeImage == 'images/a.jpg'
        ? changeImage = 'images/b.jpeg'
        : changeImage == 'images/b.jpeg'
        ? changeImage = 'images/a.jpg'
        : changeImage = 'images/b.jpeg';
    setState(() {});
  }

  sizeZero() {
    imageSize = 50;
    setState(() {});
  }
}
