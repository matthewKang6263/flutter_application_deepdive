import 'package:flutter/material.dart';

class ItemListPage extends StatelessWidget {
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
      body: Column(
        children: [
          Image.asset(
            "assets/images/list_image_01.png",
            fit: BoxFit.cover,
          ),
          Text("상품 명"),
          Text("16,000 원"),
        ],
      ),
    );
  }
}
