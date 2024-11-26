import 'package:deepdive_application/pages/detail/bottom_action_bar.dart';
import 'package:deepdive_application/pages/detail/popup_message.dart';
import 'package:deepdive_application/pages/detail/quantity_selector.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ItemDetailPage extends StatefulWidget {
  final String name;
  final int price;
  final String image;
  final String description;

  const ItemDetailPage({
    Key? key,
    required this.name,
    required this.price,
    required this.image,
    required this.description,
  }) : super(key: key);

  @override
  _ItemDetailPageState createState() => _ItemDetailPageState();
}

class _ItemDetailPageState extends State<ItemDetailPage> {
  // 상태 변수
  bool _isAccordionOpen = false; // 아코디언 UI 열림 여부
  bool _isPopupVisible = false; // 팝업 메시지 표시 여부
  int _itemQuantity = 1; // 상품 수량

  // 가격 포맷팅 함수
  String formatPrice(int price) {
    return NumberFormat("#,##0").format(price); // 천 단위로 쉼표 추가
  }

  // 아코디언 UI 상태 전환
  void toggleAccordion({bool? open}) {
    setState(() {
      _isAccordionOpen = open ?? !_isAccordionOpen; // 명시적으로 열거나 상태를 토글
    });
  }

  // 팝업 메시지 표시
  void showPopup() {
    setState(() {
      _isPopupVisible = true; // 팝업 메시지 표시
    });

    // 3초 후 팝업 숨기기
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        _isPopupVisible = false;
      });
    });
  }

  // 장바구니 버튼 클릭 처리
  void handleCartButtonClick() {
    if (_isAccordionOpen) {
      showPopup(); // 팝업 메시지 표시
    } else {
      toggleAccordion(open: true); // 아코디언 열기
    }
  }


  // 수량 업데이트
  void updateQuantity(int newQuantity) {
    if (newQuantity < 1) return; // 최소 수량은 1
    setState(() {
      _itemQuantity = newQuantity; // 상품 수량 업데이트
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name), // 상품 이름 표시
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Stack(
        children: [
          // 상품 상세 정보
          _buildProductDetails(),
          // 팝업 메시지
          if (_isPopupVisible) PopupMessage(),
          // 하단 버튼 및 수량 조정 UI
          _buildBottomActions(),
        ],
      ),
    );
  }

  /// 상품 상세 정보 UI
  Widget _buildProductDetails() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // 텍스트 왼쪽 정렬
        children: [
          // 상품 이미지
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Image.network(
              widget.image,
              fit: BoxFit.cover,
            ),
          ),
          // 상품 정보
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 상품 이름
                Text(
                  widget.name,
                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 10),
                // 상품 가격
                Row(
                  children: [
                    Text(
                      "${formatPrice(widget.price)}원",
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                // 상품 설명
                Text(
                  widget.description,
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// 하단 버튼 및 수량 조정 UI
  Widget _buildBottomActions() {
    return Align(
      alignment: Alignment.bottomCenter, // 하단에 고정
      child: Column(
        mainAxisSize: MainAxisSize.min, // 내용물 크기에 맞게 최소 크기로 설정
        children: [
          // 수량 조정 UI (아코디언)
          if (_isAccordionOpen)
            QuantitySelector(
              itemName: widget.name, // 상품 이름 전달
              itemQuantity: _itemQuantity, // 상품 수량 전달
              itemPrice: widget.price, // 상품 단가 전달
              onQuantityChanged: updateQuantity, // 수량 변경 시 호출
              onClose: () => toggleAccordion(open: false), // 닫기 버튼 클릭 시 호출
            ),
          // 하단 버튼 (장바구니, 구매하기)
                BottomActionBar(
            onCartPressed: handleCartButtonClick, // 장바구니 버튼 클릭 처리
            onBuyPressed: () =>
                toggleAccordion(open: true), // 구매하기 버튼 클릭 시 아코디언 열기
            onToggleModal: toggleAccordion, // 아코디언 열기-닫기 토글
            showModal: _isAccordionOpen, // 아코디언 상태 전달
                ),
        ],
      ),
    );
  }
}