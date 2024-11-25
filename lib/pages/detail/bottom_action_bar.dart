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
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1), // 그림자 효과
            blurRadius: 8,
            offset: Offset(0, -3), // 그림자 위치
          ),
        ],
      ),
      child: SafeArea(
        top: false, // 상단 SafeArea 비활성화 (하단만 보호)
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // 토글 버튼
              IconButton(
                icon: Icon(
                  showModal
                      ? Icons.keyboard_arrow_down // 수량 조정 UI 열려있을 때 아래 화살표
                      : Icons.keyboard_arrow_up, // 닫혀있을 때 위 화살표
                  size: 24,
                  color: Colors.grey,
                ), 
                onPressed: onToggleModal, // 토글 버튼 클릭 시 실행
              ),