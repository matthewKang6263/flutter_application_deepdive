import 'package:deepdive_application/pages/registration/add_image_screen_.dart';
import 'package:deepdive_application/pages/registration/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ItemRegistrationPage extends StatefulWidget {
  const ItemRegistrationPage({super.key});

  @override
  State<ItemRegistrationPage> createState() => _ItemRegistrationState();
}

class _ItemRegistrationState extends State<ItemRegistrationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          '상품 등록',
          style: TextStyle(fontSize: 16),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        shape: Border(
          bottom: BorderSide(
            color: Color(0xFFF0F0F0),
            width: 1,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _inputLabel('상품 이미지'),
                    SizedBox(height: 8),
                    AddImageScreen(),
                    SizedBox(height: 16),
                    _inputCnt('상품이름'),
                    SizedBox(height: 16),
                    _inputNumCnt('상품가격'),
                    SizedBox(height: 16),
                    _textareaCnt('상품내용'),
                  ],
                ),
              ),
            ),
          ),
          PrimaryButton(
            text: "등록하기",
            onPressed: () {
              print("상품 등록이 완료되었습니다.");
            },
          ),
          SizedBox(
            height: 25,
          )
        ],
      ),
    );
  }

  Widget _inputLabel(String label) {
    return Text(
      label,
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
      ),
      textAlign: TextAlign.left,
    );
  }

  InputDecoration _inputBorderStyle() {
    return InputDecoration(
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFF338BEF)),
      ),
      filled: true,
      fillColor: Color(0xFFF7F7F7),
      contentPadding: EdgeInsets.all(10),
    );
  }

  Widget _inputCnt(String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _inputLabel(label),
        SizedBox(height: 8),
        Container(
          height: 44,
          child: TextField(
            decoration: _inputBorderStyle(),
          ),
        ),
      ],
    );
  }

  Widget _inputNumCnt(String label) {
    final textController = TextEditingController();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _inputLabel(label),
        SizedBox(height: 8),
        Container(
          height: 44, // 높이를 44px로 설정
          child: Stack(
            alignment: Alignment.centerRight,
            children: [
              TextField(
                controller: textController,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  _NumericInputFormatter(),
                ],
                decoration: _inputBorderStyle(),
              ),
              Positioned(
                right: 10,
                child: Text(
                  '원',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _textareaCnt(String label) {
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
              decoration: _inputBorderStyle()),
        ),
      ],
    );
  }
}

class _NumericInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '');
    }

    // 콤마 제거
    String value = newValue.text.replaceAll(',', '');

    // 숫자로 변환
    int? number = int.tryParse(value);
    if (number == null) {
      return oldValue;
    }

    // 천 단위 콤마 추가
    String formatted = number.toString().replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},');

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}
