import 'package:deepdive_application/pages/registration/add_image_cnt.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _inputLabel('상품 이미지'),
              SizedBox(height: 8),
              TestScreen(),
              SizedBox(height: 16),
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
      textAlign: TextAlign.left,
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
    final textController = TextEditingController();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _inputLabel(label),
        SizedBox(height: 8),
        TextField(
          controller: textController,
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            _NumericInputFormatter(),
          ],
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: hintText,
            suffixIcon: Padding(
              padding: const EdgeInsets.only(right: 0, top: 13),
              child: Text('원'),
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

class _NumericInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '');
    }

    // 콤마 제거
    String value = newValue.text.replaceAll(',', '');

    // 8자리 이상이면 이전 값 유지
    if (value.length > 8) {
      return oldValue;
    }

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
