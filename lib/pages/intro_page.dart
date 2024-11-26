import 'package:deepdive_application/widgets/primary_button.dart';
import 'package:deepdive_application/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import "list/item_list_page.dart";

class IntroPage extends StatelessWidget {
  /////////////////////////////////////////////
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  IntroPage({super.key});
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
                child: PrimaryButton(
                  text: "시작하기",
                child: PrimaryButton(
                  text: "시작하기",
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ItemListPage(),
                        ));
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
