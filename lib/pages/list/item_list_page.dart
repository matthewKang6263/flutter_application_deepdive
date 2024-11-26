import 'package:deepdive_application/pages/detail/item_detail_page.dart';
import 'package:deepdive_application/pages/list/item.dart';
import 'package:deepdive_application/pages/registration/item_registration_page.dart';
import 'package:flutter/material.dart';

class ItemListPage extends StatefulWidget {
  @override
  State<ItemListPage> createState() => _ItemListPageState();
}

class _ItemListPageState extends State<ItemListPage> {
  // 상품 데이터 리스트
  List<Item> items = [
    Item(
      name: "다이브 세정제",
      price: 45000,
      image: "assets/images/list_image_01.png",
      description: "다이브 장비를 깨끗하게 관리할 수 있는 세정제입니다.",
    ),
    // 추가 아이템
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("상품 목록"),
        actions: [
          IconButton(
            onPressed: () {
              // TODO: 장바구니 페이지 이동
            },
            icon: Icon(Icons.shopping_cart_outlined),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 0.73,
          ),
          itemCount: items.length,
          itemBuilder: (context, index) {
            return itemCard(
              item: items[index],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.large(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ItemRegistrationPage(),
            ),
          );
        },
        backgroundColor: Color(0xffFF3978),
        shape: CircleBorder(),
        child: Icon(
          Icons.add,
          size: 48,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget itemCard({required Item item}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ItemDetailPage( // 상세페이지에서 데이터 변수 전달 받음
              name: item.name,
              price: item.price,
              image: item.image,
              description: item.description,
            ),
          ),
        );
      },
      child: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              item.image,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16),
            Text(
              item.name,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4),
            Text(
              "${item.price}원",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}