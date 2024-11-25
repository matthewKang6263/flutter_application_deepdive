import 'package:flutter/material.dart';

// 수량 선택 UI 위젯
class QuantitySelector extends StatelessWidget {
  final int itemQuantity; // 현재 수량
  final int itemPrice; // 상품 단가
  final ValueChanged<int> onQuantityChanged; // 수량 변경 시 호출되는 콜백
  final VoidCallback onClose; // 닫기 버튼 클릭 시 호출되는 콜백

  const QuantitySelector({
    Key? key,
    required this.itemQuantity,
    required this.itemPrice,
    required this.onQuantityChanged, // 사용자가 수량 증가/감소 버튼 선택 시 콜백 호출, 새로운 수량 값 처리
    required this.onClose, // 사용자가 닫기 버튼 누를 시 부모 위젯에서 UI를 닫는 동작 처리, 아코디언 버튼 닫힘
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16), // 내부 여백
      decoration: BoxDecoration(
        color: Colors.white, // 배경색 흰색
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2), // 그림자 효과
            blurRadius: 5, // 그림자 흐림 정도
            offset: Offset(0, -3), // 그림자의 방향과 거리
          ),
        ],
      ),
      
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // 총 금액 표시 및 닫기 버튼
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(Icons.close, size: 24, color: Colors.grey), // 닫기 아이콘
                onPressed: onClose,
              ),
              Text(
                '총 금액: ${(itemQuantity * itemPrice).toString()}원', // 총 금액 계산
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          
          SizedBox(height: 12), // 간격

          // 수량 조절 UI
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // 감소 버튼
              IconButton(
                icon: Icon(Icons.remove_circle_outline,
                    size: 32, color: Colors.blue),
                onPressed: () => onQuantityChanged(itemQuantity - 1),
              ),
              // 현재 수량
              Text(
                itemQuantity.toString(),
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // 증가 버튼
              IconButton(
                icon: Icon(Icons.add_circle_outline,
                    size: 32, color: Colors.blue),
                onPressed: () => onQuantityChanged(itemQuantity + 1),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
