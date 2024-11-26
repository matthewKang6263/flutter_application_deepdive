import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CartListPage extends StatefulWidget {
  final String? itemName;
  final int? itemPrice;
  final String? itemImage;

  const CartListPage({
    super.key,
    this.itemName,
    this.itemPrice,
    this.itemImage,
  });

  @override
  State<CartListPage> createState() => _CartListPageState();
}

class _CartListPageState extends State<CartListPage> {
  static List<Map<String, dynamic>> items = [];
  bool allSelected = false;

  @override
  void initState() {
    super.initState();
    if (widget.itemName != null &&
        widget.itemPrice != null &&
        widget.itemImage != null) {
      bool isDuplicate =
          items.any((item) => item['itemName'] == widget.itemName);
      if (!isDuplicate) {
        items.add({
          'itemImage': widget.itemImage!,
          'itemName': widget.itemName!,
          'itemPrice': widget.itemPrice!,
          'itemQuantity': 1,
          'selected': false,
        });
      }
    }
  }

  // 총 가격 계산
  num get totalPrice {
    return items.where((item) => item['selected']).fold(
        0, (sum, item) => sum + (item['itemPrice'] * item['itemQuantity']));
  }

  // 구매 완료 다이얼로그 표시
  void showPurchaseDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          // 다이얼로그를 화면 너비에 맞게 확장
          insetPadding: EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 10),
                Text(
                  '결제 완료',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
                SizedBox(height: 16),
                Text(
                  '주문이 완료되었습니다.',
                  style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                ),
                SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        items.removeWhere((item) => item['selected']);
                      });
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.blue,
                      side: BorderSide(color: Colors.blue, width: 1),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Text(
                        '확인',
                        style: TextStyle(color: Colors.blue, fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // 토스트 메시지 표시
  void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('장바구니',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: Icon(Icons.chevron_left, size: 25),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          Divider(color: Colors.grey.withOpacity(0.3), thickness: 1, height: 1),
          SizedBox(height: 6),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: allSelected,
                      onChanged: (value) {
                        setState(() {
                          allSelected = value ?? false;
                          for (var item in items) {
                            item['selected'] = allSelected;
                          }
                        });
                      },
                      side: BorderSide(color: Colors.grey[300]!, width: 1),
                      activeColor: Colors.blue,
                    ),
                    Text('전체선택',
                        style: TextStyle(fontSize: 16, color: Colors.black)),
                  ],
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      items.removeWhere((item) => item['selected']);
                      allSelected = items.isNotEmpty &&
                          items.every((item) => item['selected']);
                    });
                    // 선택 삭제 메시지를 화면 중앙에 표시
                    showDialog(
                      context: context,
                      barrierColor: Colors.transparent,
                      builder: (BuildContext context) {
                        return Center(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 28, vertical: 20),
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.center, // 중앙 정렬
                                children: [
                                  Icon(Icons.check,
                                      color: Colors.green, size: 15),
                                  SizedBox(width: 10),
                                  Text(
                                    '선택한 상품이 삭제되었습니다.',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 13),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                    // 3초 후 메시지 자동 닫기
                    Future.delayed(Duration(seconds: 3), () {
                      Navigator.of(context).pop();
                    });
                  },
                  child: Text('선택삭제',
                      style: TextStyle(fontSize: 16, color: Colors.black)),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 6.0, vertical: 8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Checkbox(
                        value: item['selected'],
                        onChanged: (value) {
                          setState(() {
                            item['selected'] = value ?? false;
                            allSelected = items.every((p) => p['selected']);
                          });
                        },
                        side: BorderSide(color: Colors.grey[300]!, width: 1),
                        activeColor: Colors.blue,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            item['itemImage'],
                            width: 110,
                            height: 110,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                width: 110,
                                height: 110,
                                color: Colors.grey[300],
                                child: Icon(Icons.error),
                              );
                            },
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item['itemName'],
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black),
                              ),
                              SizedBox(height: 8),
                              Text(
                                '${item['itemPrice']} 원',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black),
                              ),
                              SizedBox(height: 16),
                              Container(
                                width: 120,
                                height: 35,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey[300]!),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    _buildQuantityButton(
                                      icon: Icons.remove,
                                      onPressed: item['itemQuantity'] > 1
                                          ? () => setState(
                                              () => item['itemQuantity']--)
                                          : null,
                                    ),
                                    Text('${item['itemQuantity']}'),
                                    _buildQuantityButton(
                                      icon: Icons.add,
                                      onPressed: () => setState(
                                          () => item['itemQuantity']++),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Divider(color: Colors.grey.withOpacity(0.3), thickness: 1, height: 1),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text('결제정보',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                _buildPriceRow('상품 금액', '$totalPrice 원'),
                SizedBox(height: 6),
                _buildPriceRow('배송비', '3,000 원'),
                SizedBox(height: 16),
                _buildTotalPriceRow(),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed:
                      totalPrice > 0 ? () => showPurchaseDialog(context) : null,
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 14),
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)),
                  ),
                  child: Text('구매하기',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                ),
                SizedBox(height: 16)
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 수량 조절 버튼 위젯
  Widget _buildQuantityButton(
      {required IconData icon, VoidCallback? onPressed}) {
    return Container(
      width: 35,
      color: Colors.grey[200],
      child: IconButton(
        icon: Icon(icon, size: 16, color: Colors.black),
        onPressed: onPressed,
      ),
    );
  }

  // 가격 정보 행 위젯
  Widget _buildPriceRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label,
            style: TextStyle(
                fontSize: 15,
                color: Colors.grey[600],
                fontWeight: FontWeight.bold)),
        Text(value,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
      ],
    );
  }

  // 총 상품금액 행 위젯
  Widget _buildTotalPriceRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('총 상품금액',
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent)),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: '${totalPrice + 3000} ',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent),
              ),
              TextSpan(
                text: '원',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
