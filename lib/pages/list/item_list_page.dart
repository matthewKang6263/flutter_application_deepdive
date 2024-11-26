import 'package:flutter/material.dart';
import "item.dart";

class ItemListPage extends StatelessWidget {
  //product 변수 가지고 실제 데이터 넣기
  //List <Product> products = []; >>>> []안에 상품 변수와 값을 하나하나 넣기
  List<Product> products = [
    Product(name: "흰티", price: 30000, image: "assets/images/list_image_01.png"),
    Product(name: "흰티", price: 30000, image: "assets/images/list_image_02.png"),
    Product(name: "흰티", price: 30000, image: "assets/images/list_image_03.png"),
    Product(name: "흰티", price: 30000, image: "assets/images/list_image_04.png"),
    Product(name: "흰티", price: 30000, image: "assets/images/list_image_05.png"),
    Product(name: "흰티", price: 30000, image: "assets/images/list_image_06.png"),
    Product(name: "흰티", price: 30000, image: "assets/images/list_image_07.png"),
    Product(name: "흰티", price: 30000, image: "assets/images/list_image_08.png"),
    Product(name: "흰티", price: 30000, image: "assets/images/list_image_09.png"),
    Product(name: "흰티", price: 30000, image: "assets/images/list_image_10.png"),
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
                  name: products[index].name,
                  price: products[index].price,
                  image: products[index].image,
                );
              }),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Color(0xff14C2BF),
          child: Icon(Icons.add),
        ));
  }

  Widget itemCard({
    //변수넣는 ()안에 {}를 한번 더 쓰는 이유는
    required String name,
    required int price,
    required String image,
  }) {
    return Container(
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
          OutlinedButton(
              onPressed: () {},
              //버튼 자체의 스타일은 styleForm으로 쓰기
              style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Color(0xffd9d9d9)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shopping_cart_outlined,
                    //헥스코드 넣는 법 Colors(x) > Color(0) / 0xF 붙이기
                    color: Color(0xFF8A8A8A),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "담기",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
