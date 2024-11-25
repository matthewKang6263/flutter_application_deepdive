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
    