import 'package:flutter/material.dart';
import 'package:listview_app_tc/model/animal_list.dart';
//데이터들은 home에 있기 때문에 연결을 시켜줘야 한다.

class FirstPage extends StatefulWidget {
  //property
  //home에 있는 데이터를 가지고 오기 위해 *firstpage가 만들어 질때 가지고 온다.
  final List<Animal> list;

  //constructor
  const FirstPage({super.key, required this.list});
  //firstpage가 생성될때 list가 있어야 한다
  @override
  State<FirstPage> createState() => _FirstPageState();
}


//home은 _FirstPage를 모르고 FirstPage를 안다.
class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView.builder(
          itemCount: widget.list.length,
          //data는 FirstPage에 있고 _Firstpage에는 없다. 가져오기 위해 widget을 사용한다. 플러터에만 있다.(나를 만든 class에 데이터를 가지고 오기 가능)
          itemBuilder: (context, index) {
            return GestureDetector(
              //터치해서 메세지 띄우기 *몇번째를 터치했는지 알기 위해 index를 줘야한다.
              onTap: () => _showDialog(index),
              child: Card(
                child: Row(
                  children: [
                    Image.asset(
                      widget.list[index].imagePath,
                      width: 100,
                    ),
                    Text(
                      "    ${widget.list[index].animalName}",
                      // 간격을 주기위해 띄어서 사용
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
  _showDialog(int index){
    //몇번째는 정수 이기 때문에 정수로 받는다
    showDialog(
      context: context, 
      barrierDismissible: false,
      //다른곳을 눌러도 꺼지냐
      builder:(context) {
        return AlertDialog(
          title: Text(
            widget.list[index].animalName,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Row(
            children: [
              Image.asset(
                widget.list[index].imagePath,
                width: 50,
              ),
              Text(
                '    이 동물은 ${widget.list[index].kind} 입니다.\n'
                '    ${widget.list[index].flyExist ? "날 수 있습니다." : "날 수 없습니다." }'
                //bool값을 비교하여 원하는 말을 나타낼려고 삼항연산자 사용
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              //자기가 만든것만 지울려고 of를 사용 
              child: Text('종료'),
            ),
          ],
        );
      },
    );
  }
}