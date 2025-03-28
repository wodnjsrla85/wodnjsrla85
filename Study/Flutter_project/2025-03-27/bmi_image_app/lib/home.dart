import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late TextEditingController heightController;
  late TextEditingController weightController;

  late String textResult;
  late String imageResult;
  late double result;

  @override
  void initState() {
    super.initState();
    heightController = TextEditingController();
    weightController = TextEditingController();

    result = 0;
    textResult = '';
    imageResult = 'images/bmi.png';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('BMI계산기', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Column(
        children: [
          TextField(
            controller: heightController,
            decoration: InputDecoration(labelText: '신장을 입력하세요'),
            keyboardType: TextInputType.number,
          ),
          TextField(
            controller: weightController,
            decoration: InputDecoration(labelText: '몸무게를 입력하세요'),
            keyboardType: TextInputType.number,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton(
              onPressed: () => showBMI(),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              child: Text('계산하기', style: TextStyle(color: Colors.white)),
            ),
          ),
          Text(
            textResult,
            style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 20),
          ),
          SizedBox(height: 350, width: 300,child: Image.asset(imageResult)),
        ],
      ),
    );
  }

  showBMI() {
    
    if (weightController.text.trim().isEmpty ||
        heightController.text.trim().isEmpty) {
      showSnackBar();
    } else {
      double weight = double.parse(weightController.text);
      double height = double.parse(heightController.text) * 0.01;

      result = weight / (height * height); //bmi지수
      double result2 = double.parse(result.toStringAsFixed(1));
      if (result2 > 0 && result2 <= 18.4) {
        textResult = '귀하의 bmi지수는 $result2이고 저체중 입니다.';
        imageResult = 'images/underweight.png';
      } else if (result2 >= 18.5 && result2 <= 22.9) {
        textResult = '귀하의 bmi지수는 $result2이고 정상체중 입니다.';
        imageResult = 'images/normal.png';
      } else if (result2 >= 23 && result2 <= 24.9) {
        textResult = '귀하의 bmi지수는 $result2이고 과체중 입니다.';
        imageResult = 'images/risk.png';
      } else if (result2 >= 25 && result2 <= 29.9) {
        textResult = '귀하의 bmi지수는 $result2이고 비만 입니다.';
        imageResult = 'images/overweight.png';
      } else if (result2 >= 30) {
        textResult = '귀하의 bmi지수는 $result2이고 고도비만 입니다';
        imageResult = 'images/obese.png';
      }
    }

    setState(() {});
  }

  showSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('값을 제대로 입력하세요'), duration: Duration(seconds: 1)),
    );

    setState(() {});
  }
}
