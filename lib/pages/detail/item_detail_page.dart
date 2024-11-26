import 'package:deepdive_application/pages/detail/bottom_action_bar.dart';
import 'package:deepdive_application/pages/detail/quantity_selector.dart';
import 'package:flutter/material.dart';


class ItemDetailPage extends StatefulWidget {
  @override
  _ItemDetailPageState createState() => _ItemDetailPageState();
}

class _ItemDetailPageState extends State<ItemDetailPage> {
  bool _isAccordionOpen = false; // 아코디언 UI 열림 여부
  bool _isPopupVisible = false; // 팝업 메시지 표시 여부
  int _itemQuantity = 1; // 상품 수량
  final String _itemName = "테스트 상품"; // 상품 이름
  final int _itemPrice = 35000; // 상품 단가

  // 총 가격 계산
  int get totalPrice => _itemQuantity * _itemPrice;

  /// 수량 조정 UI 열기/닫기
  void toggleAccordion() {
    setState(() {
      _isAccordionOpen = !_isAccordionOpen;
    });
  }

  /// 수량 업데이트
  void updateQuantity(int newQuantity) {
    if (newQuantity < 1) return; // 최소 수량은 1
    setState(() {
      _itemQuantity = newQuantity;
    });
  }

  /// 장바구니 버튼 클릭 처리
  void handleCartButtonClick() {
    if (!_isAccordionOpen) {
      // 첫 클릭: 아코디언 UI 열기
      setState(() {
        _isAccordionOpen = true;
      });
    } else {
      // 아코디언 UI가 이미 열려 있을 경우: 팝업 메시지 표시
      showPopup();
    }
  }

  /// 팝업 메시지 표시
  void showPopup() {
    setState(() {
      _isPopupVisible = true;
    });

    // 3초 후 팝업 숨기기
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        _isPopupVisible = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("상품 상세"),
      ),
      body: Stack(
        children: [
          // 상품 상세 정보
          _buildProductDetails(),
          // 팝업 메시지
          if (_isPopupVisible) _buildPopupMessage(),
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
        children: [
          Container(
            width: double.infinity,
            height: 300,
            color: Colors.blue,
            alignment: Alignment.center,
            child: Text(
              "상품 이미지",
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "상품 이름",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      "$_itemPrice",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(width: 4),
                    Text("원", style: TextStyle(fontSize: 16)),
                  ],
                ),
                SizedBox(height: 20),
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

  /// 팝업 메시지 UI
  Widget _buildPopupMessage() {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.8),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          "장바구니에 상품이 담겼습니다.",
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  /// 하단 버튼 및 수량 조정 UI
  Widget _buildBottomActions() {
    return Align(
      alignment: Alignment.bottomCenter, // 하단에 고정된 UI 배치
      child: Column(
        mainAxisSize: MainAxisSize.min, // 하단 영역의 크기를 내용물에 맞춤
        children: [
          // 아코디언 UI (수량 조정)
          if (_isAccordionOpen)
            QuantitySelector(
              itemName: _itemName, // 상품 이름 전달
              itemQuantity: _itemQuantity, // 현재 수량 전달
              itemPrice: _itemPrice, // 상품 단가 전달
              onQuantityChanged: updateQuantity, // 수량 변경 시 호출되는 콜백 함수
              onClose: toggleAccordion, // 닫기 버튼 클릭 시 아코디언 닫기 처리
            ),

          // 하단 고정 버튼 (장바구니, 구매하기)
          BottomActionBar(
            onCartPressed: handleCartButtonClick, // 장바구니 버튼 클릭 처리
            onBuyPressed: toggleAccordion, // 구매하기 버튼 클릭 시 아코디언 열기/닫기
            onToggleModal: toggleAccordion, // 토글 버튼 클릭 시 아코디언 열기/닫기
            showModal: _isAccordionOpen, // 아코디언 상태를 BottomActionBar에 전달
          ),
        ],
      ),
    );
  }
}
