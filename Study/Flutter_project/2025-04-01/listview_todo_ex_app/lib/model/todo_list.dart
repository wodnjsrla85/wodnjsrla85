//ListView 모델 만들기
//model는 class로 만드는데 method가 없으면 model이라고 부르고 생성자는 무조건 필수다
class TodoList {
  // Property
  String imagePath; //이미지 주소
  String workList; 
  
  //required를 사용하였기 때문에 late를 사용안해도 된다.

  //Constructor
  TodoList(
    {
      // 반드시 데이터가 구성이 되어야한다(required)
      required this.imagePath,
      required this.workList,
    }
  );
}