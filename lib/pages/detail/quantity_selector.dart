import 'package:flutter/material.dart';

/// 수량 조정 UI 위젯
class QuantitySelector extends StatelessWidget {
  final String itemName; // 상품 이름
  final int itemQuantity; // 현재 수량
  final int itemPrice; // 상품 단가
  final Function(int) onQuantityChanged; // 수량 변경 콜백
  final VoidCallback onClose; // 닫기 콜백

  QuantitySelector({
    required this.itemName,
    required this.itemQuantity,
    required this.itemPrice,
    required this.onQuantityChanged,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    final totalPrice = itemQuantity * itemPrice; // 총 가격 계산

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // 상품 이름과 총 가격 표시
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    itemName,
                    style: TextStyle(
                      fontFamily: 'Pretendard',
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      letterSpacing: -0.2,
                      height: 24 / 18,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "₩${totalPrice.toString()}",
                    style: TextStyle(
                      fontFamily: 'Pretendard',
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      letterSpacing: -0.005,
                      height: 30 / 22,
                      color: Color.fromRGBO(7, 112, 232, 1),
                    ),
                  ),
                ],
              ),

              // 수량 조절 버튼
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: () {
                      if (itemQuantity > 1) {
                        onQuantityChanged(itemQuantity - 1); // 수량 감소 버튼
                      }
                    },
                  ),
                  Text(
                    '$itemQuantity',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Pretendard',
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      onQuantityChanged(itemQuantity + 1); // 수량 증가 버튼
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}