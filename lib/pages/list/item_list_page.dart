import 'dart:io';

import 'package:flutter/material.dart';
import 'package:deepdive_application/pages/list/item.dart';
import 'package:deepdive_application/pages/registration/item_registration_page.dart';
import 'package:deepdive_application/pages/cartlist_page.dart';
import 'package:deepdive_application/pages/detail/item_detail_page.dart';

List<Item> items = [];

// 상품 클래스 정의
class Item {
  final String name;
  final int price;
  final String image;
  final String description;

  Item({
    required this.name,
    required this.price,
    required this.image,
    required this.description,
  });
}

// 상품 목록 페이지 위젯
import 'package:flutter/material.dart';

//import 'register_page.dart'; 등록페이지 연동하기
//import 'detail_page.dart'; 상세페이지 연동하기
//import "cart_list_page.dart"; 장바구니페이지 연동하기

class ItemListPage extends StatefulWidget {
  final String? itemName;
  final int? itemPrice;
  final String? itemImage;
  final String? itemDescription;

  const ItemListPage({
    super.key,
    this.itemName,
    this.itemPrice,
    this.itemImage,
    this.itemDescription,
  });
  final String itemName;
  final int itemPrice;

  const ItemListPage({
    Key? key,
    required this.itemName,
    required this.itemPrice,
  }) : super(key: key);

  @override
  State<ItemListPage> createState() => _ItemListPageState();
}

class _ItemListPageState extends State<ItemListPage> {
  void addItem(Item item) {
    setState(() {
      items.add(item); // 아이템을 리스트에 추가하고 UI 갱신
    });
  }
  // 초기 상품 목록 (10개의 샘플 상품)
  // List<Item> items = [
  //   // Item(
  //   //     name: "흰티",
  //   //     price: 30000,
  //   //     image: "assets/images/list_image_01.png",
  //   //     description: "편안한 흰색 티셔츠"),
  //   // Item(
  //   //     name: "청바지",
  //   //     price: 50000,
  //   //     image: "assets/images/list_image_02.png",
  //   //     description: "클래식한 청바지"),
  //   // Item(
  //   //     name: "운동화",
  //   //     price: 80000,
  //   //     image: "assets/images/list_image_03.png",
  //   //     description: "편안한 운동화"),
  //   // Item(
  //   //     name: "모자",
  //   //     price: 20000,
  //   //     image: "assets/images/list_image_04.png",
  //   //     description: "스타일리시한 모자"),
  //   // Item(
  //   //     name: "가방",
  //   //     price: 100000,
  //   //     image: "assets/images/list_image_05.png",
  //   //     description: "실용적인 가방"),
  //   // Item(
  //   //     name: "선글라스",
  //   //     price: 60000,
  //   //     image: "assets/images/list_image_06.png",
  //   //     description: "세련된 선글라스"),
  //   // Item(
  //   //     name: "시계",
  //   //     price: 150000,
  //   //     image: "assets/images/list_image_07.png",
  //   //     description: "고급스러운 시계"),
  //   // Item(
  //   //     name: "스카프",
  //   //     price: 40000,
  //   //     image: "assets/images/list_image_08.png",
  //   //     description: "따뜻한 스카프"),
  //   // Item(
  //   //     name: "귀걸이",
  //   //     price: 25000,
  //   //     image: "assets/images/list_image_09.png",
  //   //     description: "우아한 귀걸이"),
  //   // Item(
  //   //     name: "넥타이",
  //   //     price: 35000,
  //   //     image: "assets/images/list_image_10.png",
  //   //     description: "클래식한 넥타이"),
  // ];

  @override
  void initState() {
    super.initState();
    // 새로운 상품 등록 시 리스트 맨 앞에 추가
    if (widget.itemName != null &&
        widget.itemPrice != null &&
        widget.itemImage != null &&
        widget.itemDescription != null) {
      items.insert(
        0,
        Item(
          name: widget.itemName!,
          price: widget.itemPrice!,
          image: widget.itemImage!,
          description: widget.itemDescription!,
        ),
      );
    }
  }

  //item 변수 가지고 실제 데이터 넣기
  List<Item> items = [
    Item(name: "흰티", price: 30000, image: "assets/images/list_image_01.png"),
    Item(name: "흰티", price: 30000, image: "assets/images/list_image_02.png"),
    Item(name: "흰티", price: 30000, image: "assets/images/list_image_03.png"),
    Item(name: "흰티", price: 30000, image: "assets/images/list_image_04.png"),
    Item(name: "흰티", price: 30000, image: "assets/images/list_image_05.png"),
    Item(name: "흰티", price: 30000, image: "assets/images/list_image_06.png"),
    Item(name: "흰티", price: 30000, image: "assets/images/list_image_07.png"),
    Item(name: "흰티", price: 30000, image: "assets/images/list_image_08.png"),
    Item(name: "흰티", price: 30000, image: "assets/images/list_image_09.png"),
    Item(name: "흰티", price: 30000, image: "assets/images/list_image_10.png"),
  ];

  ///////////////////////////////////////////////////////
  ///코드 추가 - 영은
  @override
  void initState() {
    super.initState();

    items.insert(
      0,
      Item(
        name: widget.itemName,
        price: widget.itemPrice,
        image:
            "assets/images/default_image.png", // 기본 이미지 사용 - 나중에 image screen 불러올 예정
      ),
    );
  }
  ///////////////////////////////////////////////////////

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('상품 목록',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            onPressed: () {
              // 장바구니 페이지로 이동 (현재는 빈 기능)
            },
            icon: Icon(Icons.shopping_cart_outlined),
          )
        ],
      ),

      // ListView를 사용하여 스크롤 가능한 body 구현
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16), // 양 끝 간격 조정
            child: GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 2, // 세로 간격 추가
                crossAxisSpacing: 12, // 가로 간격 줄임
                childAspectRatio: 0.75, // 직사각형 모양으로 조정
              ),
              itemCount: 10,
              itemBuilder: (context, index) {
                return itemCard(
                  name: items[index].name,
                  price: items[index].price,
                  image: items[index].image,
                  description: items[index].description,
                );
              }),
        ),
        //플로팅버튼은 body와 동일한 레벨로 들어감
        floatingActionButton: FloatingActionButton.large(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ItemRegistrationPage()),
            );
          },
          backgroundColor: Color(0xffFF3978),
          shape: CircleBorder(),
          child: Icon(Icons.add, size: 24, color: Colors.white),
        ),
      ),
    );
  }

  // 개별 상품 카드 위젯
  Widget itemCard({
    required String name,
    required int price,
    required String image,
    required String description,
  }) {
    return GestureDetector(
      //카드 클릭시 상세페이지로 이동하는 코드 주석처리
      /*onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(
              name: name,
              price: price,
              image: image,
            ),
          ),
        );
      },*/
      child: Container(
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
              onPressed: () {
                //담기 버튼 클릭시 장바구니 페이지로 이동하는 코드 주석
                /*
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => CartListPage(),
                  ),
                )*/
              },
              //버튼 자체의 스타일은 styleForm으로 쓰기
              style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Color(0xffd9d9d9)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.shopping_cart_outlined,
                        size: 18, color: Colors.grey[700]),
                    SizedBox(width: 4),
                    Text("담기",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[700])),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
