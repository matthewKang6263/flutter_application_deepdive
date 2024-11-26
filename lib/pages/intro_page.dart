import 'package:flutter/material.dart';
import "list/item_list_page.dart";

class IntroPage extends StatelessWidget {
  /////////////////////////////////////////////
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  /////////////////////////////////////////////

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/images/intro_bg.png",
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Column(
            children: [
              Spacer(),

              //1.
              Column(
                children: [
                  Image.asset(
                    "assets/images/logo_deepdive.png",
                    width: 160,
                  ),
                  Text(
                    "다이버 쇼퍼들을 위한 공간",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),

              Spacer(),
              SizedBox(height: 40),

              //2.
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
                child: ElevatedButton(
                  onPressed: () {
                    //페이지 이동시키기 : 함수 {} 여기 안에 넣어야함

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        ////////////////////////////////////////////////
                        ///상품 목록 화면에서 등록된 데이터를 보기 위해 코드 전달 - 영은
                        builder: (context) => ItemListPage(
                          itemName: _nameController.text,
                          itemPrice: int.tryParse(_priceController.text) ?? 0,
                        ),
                        /////////////////////////////////////////////////
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      //특정 컬러 hex 코드 넣기 0xFF : 투명도 100% 뜻
                      backgroundColor: Color(0xFF0770E9),
                      minimumSize: Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      )),
                  child: Text(
                    "시작하기",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
