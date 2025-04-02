// 젤 처음 하는건 모델
class Animal{
  //property
  String imagePath;//이미지 주소
  String animalName;//이름
  String kind; //종류
  bool flyExist; //날수있냐 없냐

  Animal({
    required this.imagePath,
    required this.animalName,
    required this.kind,
    required this.flyExist,
  });
}