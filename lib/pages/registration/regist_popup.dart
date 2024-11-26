import 'dart:ffi';

import 'package:deepdive_application/pages/intro_page.dart';
import 'package:deepdive_application/pages/list/item_list_page.dart';
import 'package:flutter/material.dart';

class RegistPopup extends StatelessWidget {
  final VoidCallback onConfirm;

  const RegistPopup({Key? key, required this.onConfirm}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16), // 모서리 둥글게
      ),
      child: Container(
        padding: EdgeInsets.all(20),
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min, // 내용에 맞게 크기 조정
          children: [
            SizedBox(height: 20),
            Text(
              '상품을 등록하시겠습니까?',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      '취소',
                      style: TextStyle(
                          color: Color(0xFF0770E9),
                          fontWeight: FontWeight.bold), // 텍스트 색상
                    ),
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.white, // 배경색
                      side: BorderSide(
                        color: Color(0xFF338BEF), // 테두리 색상
                        width: 1, // 테두리 두께
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4), // 모서리 둥글게
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10), // 버튼 사이의 간격
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      onConfirm(); // 확인 시 실행할 콜백
                      Navigator.of(context).pop();
                      Navigator.of(context).pop(items);
                      // Navigator.of(context).pop(
                      //   MaterialPageRoute(builder: (context) => ItemListPage()),
                      // );
                    },
                    child: Text(
                      '확인',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold), // 텍스트 색상
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF0770E9), // 배경색
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4), // 모서리 둥글게
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
