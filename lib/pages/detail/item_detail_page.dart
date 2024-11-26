import 'package:deepdive_application/pages/cartlist_page.dart';
import 'package:deepdive_application/pages/detail/bottom_action_bar.dart';
import 'package:deepdive_application/pages/detail/popup_message.dart';
import 'package:deepdive_application/pages/detail/quantity_selector.dart';
import 'package:flutter/material.dart';

class ItemDetailPage extends StatefulWidget {
  //*final Item item(Item객체 전달받음)
  @override
  _ItemDetailPageState createState() => _ItemDetailPageState();
}

class _ItemDetailPageState extends State<ItemDetailPage> {
  // 상태 변수
  bool _isAccordionOpen = false; // 아코디언 UI 열림 여부
  bool _isPopupVisible = false; // 팝업 메시지 표시 여부
  int _itemQuantity = 1; // 상품 수량
  final String _itemName = "테스트 상품"; // 상품 이름
  final int _itemPrice = 35000; // 상품 단가

  /// 총 가격 계산
  int get totalPrice => _itemQuantity * _itemPrice;

  /// 아코디언 UI 상태 전환
  void toggleAccordion({bool? open}) {
    setState(() {
      _isAccordionOpen = open ?? !_isAccordionOpen; // 명시적으로 열거나, 상태를 토글
    });
  }

  /// 팝업 메시지 표시
  void showPopup() {
    setState(() {
      _isPopupVisible = true; // 팝업 메시지 표시
    });

    // 3초 후 팝업 숨기기
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        _isPopupVisible = false;
      });
    });
  }

  /// 장바구니 버튼 클릭 처리
  void handleCartButtonClick() {
    if (_isAccordionOpen) {
      showPopup(); // 팝업 메시지 표시
    } else {
      toggleAccordion(open: true); // 아코디언 열기
    }
  }

  /// 수량 업데이트
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
        title: Text("상품 상세"), // 페이지 제목
      ),
      body: Stack(
        children: [
          // 상품 상세 정보
          _buildProductDetails(),
          // 팝업 메시지
          if (_isPopupVisible)
            PopupMessage(
              onConfirm: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CartListPage()),
                );
              },
            ),
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
          Container(
            width: double.infinity,
            height: 300,
            color: Colors.blue, // 샘플 이미지 색상
            alignment: Alignment.center,
            child: Text(
              "상품 이미지",
              style: TextStyle(color: Colors.white, fontSize: 24),
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
                  "상품 이름",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 10),
                // 가격 정보
                Row(
                  children: [
                    Text(
                      "$_itemPrice", // 단가
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(width: 4),
                    Text("원", style: TextStyle(fontSize: 16)),
                  ],
                ),
                SizedBox(height: 20),
                // 상품 설명
                Text(
                  "상품 상세 설명입니다.",
                  style: TextStyle(fontSize: 16),
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
              itemName: _itemName,
              itemQuantity: _itemQuantity, // 현재 상품 수량 전달
              itemPrice: _itemPrice, // 상품 단가 전달
              onQuantityChanged: updateQuantity, // 수량 변경 시 호출
              onClose: () => toggleAccordion(open: false),  // 닫기 버튼 클릭 시 호출
            ),
          // 하단 버튼 (장바구니, 구매하기)
          BottomActionBar(
            onCartPressed: handleCartButtonClick, // 장바구니 버튼 클릭 처리
            onBuyPressed: () => toggleAccordion(open: true), // 구매하기 버튼 클릭 시 아코디언 열기
            onToggleModal: toggleAccordion, // 아코디언 열기/닫기 토글
            showModal: _isAccordionOpen, // 아코디언 상태 전달
          ),
        ],
      ),
    );
  }
}