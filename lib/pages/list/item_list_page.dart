import 'package:deepdive_application/widgets/tertiary_button.dart';
import 'package:flutter/material.dart';
import "item.dart";
//import 'register_page.dart'; 등록페이지 연동하기
//import 'detail_page.dart'; 상세페이지 연동하기
//import "cart_list_page.dart"; 장바구니페이지 연동하기

class ItemListPage extends StatefulWidget {
  @override
  State<ItemListPage> createState() => _ItemListPageState();
}

class _ItemListPageState extends State<ItemListPage> {
  //item 변수 가지고 실제 데이터 넣기
  List<Item> items = [
    Item(
        name: "다이브 세정제",
        price: 45000,
        image: "assets/images/list_image_01.png"),
    Item(
        name: "다이브 고글 보관함",
        price: 89000,
        image: "assets/images/list_image_02.png"),
    Item(
        name: "다이빙 핀 보관대",
        price: 120000,
        image: "assets/images/list_image_03.png"),
    Item(
        name: "산호 보호대 장식품",
        price: 35000,
        image: "assets/images/list_image_04.png"),
    Item(
        name: "다이브 소독 스프레이",
        price: 55000,
        image: "assets/images/list_image_05.png"),
    Item(
        name: "프로 다이버 장비세트",
        price: 890000,
        image: "assets/images/list_image_06.png"),
    Item(
        name: "스쿠버 보틀 쿨러",
        price: 75000,
        image: "assets/images/list_image_07.png"),
    Item(
        name: "다이브 장비 세척 키트",
        price: 150000,
        image: "assets/images/list_image_08.png"),
    Item(
        name: "장비 보관함",
        price: 230000,
        image: "assets/images/list_image_09.png"),
    Item(
        name: "다이브 장비 오일",
        price: 48000,
        image: "assets/images/list_image_10.png"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("상품 목록"),

          //액션버튼 추가시 여러개 들어갈 수 있기 때문에 []안에 들어가야 함
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.shopping_cart_outlined),
            )
          ],
        ),
        //body는 위젯을 하나만 받을 수 있음
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 0.73,
              ),
              itemCount: 10,
              itemBuilder: (context, index) {
                return itemCard(
                  //여기에 변수 넣기
                  name: items[index].name,
                  price: items[index].price,
                  image: items[index].image,
                );
              }),
        ),
        //플로팅버튼은 body와 동일한 레벨로 들어감
        floatingActionButton: FloatingActionButton.large(
          onPressed: () {
            //클릭하면 등록페이지로 이동
            /*Navigator.push(context, MaterialPageRoute(
              builder: (context) => RegisterPage(),
              ),
            )*/
          },
          backgroundColor: Color(0xffFF3978),
          shape: CircleBorder(),
          child: Icon(
            Icons.add,
            size: 48,
            color: Colors.white,
          ),
        ));
  }

  Widget itemCard({
    //변수넣는 ()안에 {}를 한번 더 쓰는 이유는
    required String name,
    required int price,
    required String image,
  }) {
    return GestureDetector(
      //카드 클릭시 상세페이지로 이동하는 코드 주석처리
      /*onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ItemDetailPage(
              name: name,
              price: price,
              image: image,
            ),
          ),
        );
      },*/

      child: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          //Column의 경우:
          //mainAxisAlignment: 세로(↕️) 방향 정렬
          //crossAxisAlignment: 가로(↔️) 방향 정렬

          //Row의 경우:
          //mainAxisAlignment: 가로(↔️) 방향 정렬
          //crossAxisAlignment: 세로(↕️) 방향 정렬

          children: [
            Image.asset(
              image, //원래 있었던 URL을 위에 선언해준 공통 변수로 변경
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              name, //원래 있었던 URL을 위에 선언해준 공통 변수로 변경
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              "$price원", //원래 있었던 URL을 위에 선언해준 공통 변수로 변경
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            SizedBox(
              child: TertiaryButton(
                text: "담기",
                icon: Icons.shopping_cart_outlined,
                onPressed: () {
                  //담기 버튼 클릭시 장바구니 페이지로 이동하는 코드 주석
                  /*
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => CartListPage(),
                    ),
                  )*/
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
