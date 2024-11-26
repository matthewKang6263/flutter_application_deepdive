import 'package:deepdive_application/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import "list/item_list_page.dart";

// IntroPage 위젯: 앱의 인트로 화면을 나타내는 StatelessWidget
class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 배경 이미지
          Image.asset(
            "assets/images/intro_bg.png",
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Column(
            children: [
              const Spacer(), // 상단 여백
              // 로고와 텍스트
              Column(
                children: [
                  // 로고 이미지
                  Image.asset(
                    "assets/images/logo_deepdive.png",
                    width: 160,
                  ),
                  // 앱 설명 텍스트
                  const Text(
                    "다이버 쇼퍼들을 위한 공간",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const Spacer(), // 중간 여백
              const SizedBox(height: 40), // 추가 여백
              // 시작하기 버튼
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
                child: PrimaryButton(
                  text: "시작하기",
                  onPressed: () {
                    // ItemListPage로 이동 (매개변수 없이)
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ItemListPage(),
                      ),
                    );
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
