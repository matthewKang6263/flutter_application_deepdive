import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'list/item_list_page.dart';

// CartListPage 위젯: 장바구니 페이지를 나타내는 StatefulWidget
class CartListPage extends StatefulWidget {
  const CartListPage({super.key});

  @override
  State<CartListPage> createState() => _CartListPageState();
}

class _CartListPageState extends State<CartListPage> {
  // 장바구니 아이템 목록
  final List<Map<String, dynamic>> items = [
    {
      'itemImage': 'https://via.placeholder.com/150',
      'itemName': '상품 명',
      'itemPrice': 26000,
      'itemQuantity': 1,
      'selected': false,
    },
    {
      'itemImage': 'https://via.placeholder.com/150',
      'itemName': '상품 명',
      'itemPrice': 26000,
      'itemQuantity': 1,
      'selected': false,
    },
    {
      'itemImage': 'https://via.placeholder.com/150',
      'itemName': '상품 명',
      'itemPrice': 26000,
      'itemQuantity': 1,
      'selected': false,
    },
    {
      'itemImage': 'https://via.placeholder.com/150',
      'itemName': '상품 명',
      'itemPrice': 26000,
      'itemQuantity': 1,
      'selected': false,
    },
  ];

  // 전체 선택 상태를 나타내는 변수
  bool allSelected = false;

  // 선택된 상품들의 총 가격을 계산하는 getter
  num get totalPrice {
    num sum = 0;
    for (var item in items) {
      if (item['selected']) {
        sum += (item['itemPrice'] * item['itemQuantity']);
      }
    }
    return sum;
  }

  // 구매 완료 다이얼로그를 표시하는 함수
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
                    MaterialPageRoute(
                        builder: (context) => ItemListPage(
                              itemName: 'test',
                              itemPrice: 10000,
                            )),
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

  // 토스트 메시지를 표시하는 함수
  void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.black87,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 앱바 설정
      appBar: AppBar(
        title: Text('장바구니',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left,
            size: 25,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          // 상단 구분선
          Divider(
            color: Colors.grey.withOpacity(0.3),
            thickness: 1,
            height: 1,
          ),
          SizedBox(height: 6),
          // 전체 선택 및 선택 삭제 버튼
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    // 전체 선택 체크박스
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
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                  ],
                ),
                // 선택 삭제 버튼
                TextButton(
                  onPressed: () {
                    setState(() {
                      items.removeWhere((item) => item['selected']);
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 2, vertical: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.check,
                                color: Colors.green,
                                size: 24,
                              ),
                              SizedBox(width: 8),
                              Flexible(
                                child: Text(
                                  '선택한 상품이 삭제되었습니다.',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                        duration: Duration(seconds: 3),
                        backgroundColor: Colors.black,
                        behavior: SnackBarBehavior.floating,
                        margin: EdgeInsets.only(
                          bottom: MediaQuery.of(context).size.height / 2,
                          left: 20,
                          right: 20,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    );
                  },
                  child: Text(
                    '선택삭제',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
          // 장바구니 아이템 목록
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
                      // 아이템 선택 체크박스
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
                      // 상품 이미지
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            item['itemImage'],
                            width: 110,
                            height: 110,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      // 상품 정보
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // 상품명
                              Text(
                                item['itemName'],
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 8),
                              // 상품 가격
                              Text(
                                '${item['itemPrice']} 원',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 16),
                              // 수량 조절 컨테이너
                              Container(
                                width: 120, // 원하는 너비
                                height: 35, // 원하는 높이
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: const Color.fromARGB(
                                          255, 216, 216, 216)),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 35, // - 버튼의 너비
                                      color: const Color.fromARGB(
                                          255, 235, 235, 235),
                                      child: IconButton(
                                        icon: Icon(Icons.remove,
                                            size: 16, color: Colors.black),
                                        onPressed: item['itemQuantity'] > 1
                                            ? () {
                                                setState(() {
                                                  item['itemQuantity']--;
                                                });
                                              }
                                            : null,
                                      ),
                                    ),
                                    Text('${item['itemQuantity']}'),
                                    Container(
                                      width: 35, // + 버튼의 너비
                                      color: const Color.fromARGB(
                                          255, 235, 235, 235),
                                      child: IconButton(
                                        icon: Icon(Icons.add,
                                            size: 16, color: Colors.black),
                                        onPressed: () {
                                          setState(() {
                                            item['itemQuantity']++;
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              )
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
          // 하단 구분선
          Divider(
            color: Colors.grey.withOpacity(0.3),
            thickness: 1,
            height: 1,
          ),
          // 결제 정보 섹션
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // 결제 정보 제목
                Row(
                  children: [
                    Text('결제정보',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                  ],
                ),
                SizedBox(height: 10),
                // 상품 금액 표시
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('상품 금액',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.bold)),
                    Text(
                      '$totalPrice 원',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 6),
                // 배송비 표시
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('배송비',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.bold)),
                    Text('3,000 원',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                  ],
                ),
                SizedBox(height: 16),
                // 총 상품금액 표시
                Row(
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
                              color: Colors.blueAccent,
                            ),
                          ),
                          TextSpan(
                            text: '원',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueAccent,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                // 구매하기 버튼
                ElevatedButton(
                  onPressed: totalPrice > 0
                      ? () {
                          showPurchaseDialog(context);
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 14),
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  child: Text('구매하기',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                ),
                SizedBox(height: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
