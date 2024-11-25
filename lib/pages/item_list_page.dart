import 'package:flutter/material.dart';

class ItemListPage extends StatelessWidget {
  // 샘플 데이터를 담을 리스트 생성
  final List<Map<String, dynamic>> items = [
    {
      "name": "상품1",
      "price": 10000,
      "image": "assets/images/item1.jpg",
    },
    {
      "name": "상품2",
      "price": 20000,
      "image": "assets/images/item2.jpg",
    },
    // ... 더 많은 상품 추가 가능
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
              itemCount: items.length, // 실제 아이템 개수로 수정
              itemBuilder: (context, index) {
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
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            // 이미지 모서리를 깎기 위해 추가
            borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
            child: AspectRatio(
              // 이미지 비율을 일정하게 유지
              aspectRatio: 1,
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            // 텍스트들을 패딩으로 감싸서 여백 추가
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "$price원",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
