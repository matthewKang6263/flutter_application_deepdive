import 'package:flutter/material.dart';

class BottomActionBar extends StatelessWidget {
  final VoidCallback onCartPressed; // 장바구니 버튼 클릭 시 실행되는 콜백
  final VoidCallback onBuyPressed; // 구매하기 버튼 클릭 시 실행되는 콜백
  final VoidCallback onToggleModal; // 토글 버튼 클릭 시 실행되는 콜백
  final bool showModal; // 수량 조정 UI 표시 여부

  const BottomActionBar({
    Key? key,
    required this.onCartPressed,
    required this.onBuyPressed,
    required this.onToggleModal,
    required this.showModal,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white, // 하단 탭바 배경 흰색