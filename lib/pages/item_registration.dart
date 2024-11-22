import 'package:deepdive_application/pages/test_screen.dart';
import 'package:flutter/material.dart';

class ItemRegistration extends StatefulWidget {
  const ItemRegistration({super.key});

  @override
  State<ItemRegistration> createState() => _ItemRegistrationState();
}

class _ItemRegistrationState extends State<ItemRegistration> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('상품 등록'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: SafeArea(
          child: Column(
            children: [
              TestScreen(),
              _inputCnt('상품이름', '이름을 입력해주세요.'),
              SizedBox(height: 16),
              _inputNumCnt('상품가격', '가격을 입력해주세요.'),
              SizedBox(height: 16),
              _textareaCnt('상품내용', '설명을 입력해주세요.'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _inputLabel(String label) {
    return Text(
      label,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _inputCnt(String label, String hintText) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _inputLabel(label),
        SizedBox(height: 8),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: hintText,
          ),
        ),
      ],
    );
  }

  Widget _inputNumCnt(String label, String hintText) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _inputLabel(label),
        SizedBox(height: 8),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: hintText,
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 13, top: 13), // 오른쪽 여백 추가
              child: Text('₩'), // ₩ 기호
            ),
          ),
        ),
      ],
    );
  }

  Widget _textareaCnt(String label, String hintText) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _inputLabel(label),
        SizedBox(height: 8),
        Container(
          height: 150,
          child: TextField(
            maxLines: null,
            expands: true,
            maxLength: 100,
            decoration: InputDecoration(
              hintText: hintText,
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.all(10),
            ),
          ),
        ),
      ],
    );
  }
}
