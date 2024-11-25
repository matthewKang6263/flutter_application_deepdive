import 'package:flutter/material.dart';
import 'package:flutter_application_deepdive/pages/detail/bottom_action_bar.dart';
import 'package:flutter_application_deepdive/pages/detail/quantity_selector.dart';

// 상품 상세 페이지 클래스
class ItemDetailPage extends StatefulWidget {
  @override
  _ItemDetailPageState createState() => _ItemDetailPageState();
}

class _ItemDetailPageState extends State<ItemDetailPage> {
  bool _showQuantitySelector = false; // 수량 조정 UI 표시 여부
  int _itemQuantity = 1; // 초기 수량
  int _itemPrice = 35000; // 상품 단가

  // 총 가격 계산
  int get totalPrice => _itemQuantity * _itemPrice;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("상품 상세"),), // 상단 앱바
      body: Stack(
        children: [
          // 상품 상세 정보 영역
          SingleChildScrollView(
            child: Column(
              children: [
                // 상품 이미지
                Container(
                  width: double.infinity,
                  height: 300,
                  color: Colors.blue, // 샘플 이미지 대체
                  alignment: Alignment.center,
                  child: Text(
                    "이미지",
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ),
                SizedBox(height: 20),
                // 상품 이름과 가격 정보
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 상품 이름
                      Text(
                        "상품 이름",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 10),
                      // 가격 표시
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "$_itemPrice", // 단가
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(width: 4),
                          Text(
                            "원", // 단위
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      // 상품 상세 설명
                      Text(
                        "상품 상세 설명입니다.",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // 하단 고정 영역: 버튼과 수량 조정 UI
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (_showQuantitySelector)
                  QuantitySelector(
                    itemQuantity: _itemQuantity,
                    itemPrice: _itemPrice,
                    onQuantityChanged: updateQuantity,
                    onClose: toggleQuantitySelector,
                  ),
                BottomActionBar(
                  onCartPressed: showQuantitySelectorDirectly,
                  onBuyPressed: showQuantitySelectorDirectly,
                  onToggleModal: toggleQuantitySelector,
                  showModal: _showQuantitySelector,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}