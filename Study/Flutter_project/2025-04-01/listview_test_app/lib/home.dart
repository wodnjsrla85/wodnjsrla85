import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //Porperty
  // late List<String> todoList; //ListView에 표시할 내용들
  late List<int> todoList;
  
  @override
  void initState() {
    super.initState();
    todoList = []; //초기화
    addData(); //데이터를 넣는 함수
  }
  //flutter에 ListVew는 데이터를 아무리 많이 잡아도 데이터 크기는 한화면의 위 50% 아래 50% 씩 가지고 있어서
  //스크롤 할때 위에 데이터를 날리고 아래데이터를 가지고 이런식으로 한다. *메모리 재활용

  // addData(){
  //   todoList.add('James');
  //   todoList.add('Cathy');
  //   todoList.add('Martin');
  //   todoList.add('유비');
  //   todoList.add('관우');
  //   todoList.add('장비');
  //   todoList.add('피카츄');
  //   todoList.add('라이츄');
  //   todoList.add('파이리');
  //   todoList.add('꼬부기');
  //   todoList.add('조조');
  //   todoList.add('여포');
  //   todoList.add('동탁');
  // }

  addData(){
    for(int i = 1; i<=1000;i++){
      todoList.add(i);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main View'),
      ),
      body: Center(
        child: ListView.builder(
        //데이터를 가지고 화면을 구성하여야 하기 떄문에 builder를 사용해야한다.
          itemCount: todoList.length, //아이템의 객수가 몇개인지 / 계속 추가가 되니깐 함수를 이용해 데이터를 넣어줌
          itemBuilder: (context, index) { //아이템들을 불러 오는 것  index는 몇번인지 번호를 기억해야 하기때문에 있다.
            return SizedBox(
              height: 100, //Card의 크기를 키워주기 위해서 SiedBox로 감싸서 줘야한다 
              child: Card( 
                //카드 형식으로 view를 보여주기 위해 사용
                //카드 모양 하나 가지고 만든다
                color: Colors.amber,//Card의 색상
                child: Center(
                  child: Text(
                    //index로 지정해야 기억하고 다음 껄 밑에 보여주기 떄문이다.
                    todoList[index].toString(),
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ), 
              ),
            );
          },
        ), 
      ),
    );
  }
}