import 'package:deepdive_application/pages/list/item_list_page.dart';
import 'package:flutter/material.dart';

class RegistPopup extends StatelessWidget {
  final String itemName; // 상품 이름
  final String itemPrice; // 상품 가격 (String)
  final VoidCallback onConfirm;

  const RegistPopup({
    Key? key,
    required this.onConfirm,
    required this.itemName,
    required this.itemPrice,
  }) : super(key: key);

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
                      Navigator.of(context).pop(); // 팝업 닫기
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

                      // itemPrice를 int로 변환하여 ItemListPage에 전달
                      int price = int.tryParse(itemPrice) ?? 0; // 변환 실패 시 기본값 0

                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => ItemListPage(
                            itemName: itemName,
                            itemPrice: price, // int로 변환된 가격 전달
                          ),
                        ),
                      );
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
