import 'package:flutter/material.dart';

class ItemListPage extends StatelessWidget {
  ////////////////////////////////////////////////
  //등록하기 페이지로부터 전달받을 데이터 - 영은
  final String itemName;
  final String itemPrice;
  final String itemDescription;

  ItemListPage({
    Key? key,
    required this.itemName,
    required this.itemPrice,
    required this.itemDescription,
  }) : super(key: key);
  ////////////////////////////////////////////////

  // 상품 데이터를 담을 리스트를 만들어요
  final List<Map<String, dynamic>> items = [
    {
      "name": "스쿠버 수트",
      "price": 50000,
      "image": "assets/images/suit.jpg",
    },
    {
      "name": "스노클",
      "price": 20000,
      "image": "assets/images/snorkel.jpg",
    },
    // 여기에 더 많은 상품을 추가할 수 있어요
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("상품 목록"),
          actions: [
            IconButton(
              onPressed: () {},
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
                childAspectRatio: 0.75,
              ),
              itemCount: items.length, // 상품 개수만큼 그리드 아이템 생성
              itemBuilder: (context, index) {
                // items 리스트에서 각 상품 데이터를 가져와서 itemCard에 전달
                return itemCard(
                  name: items[index]["name"],
                  price: items[index]["price"],
                  image: items[index]["image"],
                );
              }),
        ));
  }

  Widget itemCard({
    required String name,
    required int price,
    required String image,
  }) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            image,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 16),
          Text(
            itemName,
            // itemDescription,
            // name,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 4),
          Text(
            itemPrice,
            // "$price원",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
