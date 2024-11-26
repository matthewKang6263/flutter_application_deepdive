import 'package:deepdive_application/pages/cartlist_page.dart';
import 'package:flutter/material.dart';

class PopupMessage extends StatelessWidget {
  const PopupMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 350, // Hug Width
        constraints: BoxConstraints(maxWidth: 312), // 최대 너비
        height: 45, // Hug Height
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16), // 내부 패딩
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.8), // 배경색
          borderRadius: BorderRadius.circular(8), // 모서리 둥글기
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // 1. 체크 이모티콘
            Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 16,
            ),
            SizedBox(width: 6), // 이모티콘과 텍스트 간격

            // 2. "장바구니에 상품이 담겼습니다" 텍스트
            Expanded(
              child: Text(
                "장바구니에 상품이 담겼습니다",
                style: TextStyle(
                  fontFamily: 'Pretendard', // 폰트
                  fontSize: 15, // 텍스트 크기
                  fontWeight: FontWeight.w700, // 텍스트 굵기
                  color: Colors.white, // 텍스트 색상
                ),
              ),
            ),
            SizedBox(width: 5), // 텍스트와 "확인하기" 간격

            // 3. "확인하기" 링크
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CartListPage()), // "확인하기" 클릭 시 장바구니로 이동
                );
              },
              child: Text(
                "확인하기",
                style: TextStyle(
                  fontFamily: 'Pretendard',
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  decoration: TextDecoration.underline, // 밑줄
                  decorationStyle: TextDecorationStyle.solid,
                  decorationColor: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
