import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
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
                    print("버튼이 클릭되었습니다!");
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, //특정 컬러 hex 코드 넣기
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
