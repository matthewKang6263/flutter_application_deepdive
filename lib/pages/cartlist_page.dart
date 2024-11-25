import 'package:flutter/material.dart';

class CartListPage extends StatefulWidget {
  @override
  State<CartListPage> createState() => _CartListPageState();
}

class _CartListPageState extends State<CartListPage> {
  final List<Map<String, dynamic>> Items = [
    {
      'itemImage': 'https://via.placeholder.com/100',
      'itemName': '상품 명',
      'itemPrice': 16000,
      'itemQuantity': 1,
      'selected': false,
    },
    {
      'itemImage': 'https://via.placeholder.com/100',
      'itemName': '상품 명',
      'itemPrice': 16000,
      'itemQuantity': 1,
      'selected': false,
    },
    {
      'itemImage': 'https://via.placeholder.com/100',
      'itemName': '상품 명',
      'itemPrice': 16000,
      'itemQuantity': 1,
      'selected': false,
    },
  ];

  bool allSelected = false;

  num get totalPrice {
    num sum = 0;
    for (var item in Items) {
      if (item['selected']) {
        sum += (item['itemPrice'] * item['itemQuantity']);
      }
    }
    return sum;
  }

  void showPurchaseDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('결제 완료', textAlign: TextAlign.center),
          content: Text('주문이 완료되었습니다.', textAlign: TextAlign.center),
          actions: [
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => ItemListPage()),
                  );
                },
                child: Text(
                  '확인',
                  style: TextStyle(color: Colors.blue, fontSize: 16),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('장바구니'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          // 전체 선택 체크박스와 삭제 버튼
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
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
                          for (var item in Items) {
                            item['selected'] = allSelected;
                          }
                        });
                      },
                    ),
                    Text('전체선택'),
                  ],
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      Items.removeWhere((item) => item['selected']);
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('선택한 상품이 삭제되었습니다.'),
                        duration: Duration(seconds: 3),
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: Colors.black87,
                        action: SnackBarAction(
                          label: '닫기',
                          textColor: Colors.white,
                          onPressed: () {},
                        ),
                      ),
                    );
                  },
                  child: Text('선택삭제'),
                ),
              ],
            ),
          ),
          // 상품 리스트
          Expanded(
            child: ListView.builder(
              itemCount: Items.length,
              itemBuilder: (context, index) {
                final item = Items[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: Row(
                    children: [
                      Checkbox(
                        value: item['selected'],
                        onChanged: (value) {
                          setState(() {
                            item['selected'] = value ?? false;
                            allSelected = Items.every((p) => p['selected']);
                          });
                        },
                      ),
                      Image.network(
                        item['itemImage'],
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(item['itemName'],
                                style: TextStyle(fontSize: 16)),
                            SizedBox(height: 4),
                            Text('${item['itemPrice']} 원',
                                style: TextStyle(color: Colors.grey)),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.remove),
                            onPressed: item['itemQuantity'] > 1
                                ? () {
                                    setState(() {
                                      item['itemQuantity']--;
                                    });
                                  }
                                : null,
                          ),
                          Text('${item['itemQuantity']}'),
                          IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () {
                              setState(() {
                                item['itemQuantity']++;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          // 결제 정보
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('상품 금액', style: TextStyle(fontSize: 16)),
                    Text('${totalPrice} 원', style: TextStyle(fontSize: 16)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('배송비', style: TextStyle(fontSize: 16)),
                    Text('3,000 원', style: TextStyle(fontSize: 16)),
                  ],
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('총 상품금액',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Text('${totalPrice + 3000} 원',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue)),
                  ],
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: totalPrice > 0
                      ? () {
                          showPurchaseDialog(context);
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: Colors.blue,
                  ),
                  child: Text('구매하기', style: TextStyle(fontSize: 18)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
