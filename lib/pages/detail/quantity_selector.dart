import 'package:flutter/material.dart';

// 수량 선택 UI 위젯
class QuantitySelector extends StatelessWidget {
  final int itemQuantity; // 현재 수량
  final int itemPrice; // 상품 단가
  final ValueChanged<int> onQuantityChanged; // 수량 변경 시 호출되는 콜백
  final VoidCallback onClose; // 닫기 버튼 클릭 시 호출되는 콜백