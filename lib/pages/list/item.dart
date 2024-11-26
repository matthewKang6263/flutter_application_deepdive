//클래스는 중괄호 {}로 시작하고 끝난다.
class Item {
  //변수 설정
  String name;
  int price;
  String image;

  //변수 사용 : 생성자 만들기
  Item({
    required this.name,
    required this.price,
    required this.image,
  });
}
