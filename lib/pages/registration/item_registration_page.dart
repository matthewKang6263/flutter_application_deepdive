import 'dart:ffi';
import 'package:deepdive_application/pages/list/item_list_page.dart';
import 'package:deepdive_application/pages/registration/add_image_screen_.dart';
import 'package:deepdive_application/pages/registration/regist_popup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class ItemRegistrationPage extends StatefulWidget {
  const ItemRegistrationPage({super.key});

  @override
  State<ItemRegistrationPage> createState() => _ItemRegistrationState();
}

class _ItemRegistrationState extends State<ItemRegistrationPage> {
  String imgPath = '';

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  bool _isImageAttached = false;

  bool get _isFormValid {
    return _isImageAttached &&
        _nameController.text.isNotEmpty &&
        _priceController.text.isNotEmpty &&
        _descriptionController.text.isNotEmpty;
  }

  void _showConfirmationDialog() {
    String nameValue = _nameController.text;
    String numValue = _priceController.text;
    String descriptionValue = _descriptionController.text;
    int number = int.parse(numValue);

    if (imgPath.isEmpty) {
      // 이미지 경로가 비어있으면 다이얼로그를 띄우지 않음
      print("이미지 경로가 비어 있습니다.");
      return; // 다이얼로그를 띄우지 않음
    }

    // showDialog(
    //   context: context,
    //   builder: (BuildContext context) {
    //     return RegistPopup(
    //       onConfirm: () {
    //         // 아이템 리스트에 새로운 아이템 추가
    //         items.add(
    //           Item(
    //             name: nameValue,
    //             price: number,
    //             image: imgPath,
    //             description: descriptionValue,
    //           ),
    //         );
    //         print("상품 등록이 완료되었습니다.");

    //         // ItemListPage로 이동하며 아이템 목록을 전달
    //         Navigator.push(
    //           context,
    //           MaterialPageRoute(
    //             builder: (context) => ItemListPage(), // 아이템 리스트를 전달
    //           ),
    //         );
    //       },
    //     );
    //   },
    // );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return RegistPopup(onConfirm: () {
          setState(() {
            items.add(
              Item(
                name: nameValue,
                price: number,
                image: imgPath,
                description: descriptionValue,
              ), //imgPath 빈값인지 확인하기 / 빈값이면 쇼다이얼로그 안되게
            );
          });

          print("상품 등록이 완료되었습니다.");
          // 실제 등록 로직 추가 가능
        });
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _nameController.addListener(_updateButtonState);
    _priceController.addListener(_updateButtonState);
    _descriptionController.addListener(_updateButtonState);
  }

  void _updateButtonState() {
    setState(() {});
  }

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

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
                    AddImageScreen(
                      onImageAttached: (path) {
                        if (path != '') {
                          setState(
                            () {
                              imgPath = path;
                              _isImageAttached = true;
                            },
                          );
                        }
                      },
                    ),
                    SizedBox(height: 16),
                    _inputCnt('상품이름', _nameController),
                    SizedBox(height: 16),
                    _inputNumCnt('상품가격', _priceController),
                    SizedBox(height: 16),
                    _textareaCnt('상품내용', _descriptionController),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            width: double.infinity, // 원하는 너비 설정
            child: PrimaryButton(
              text: "등록하기",
              onPressed: _isFormValid ? _showConfirmationDialog : null,
              backgroundColor: _isFormValid ? Color(0xFF0770E9) : Colors.grey,
            ),
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

  Widget _inputCnt(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _inputLabel(label),
        SizedBox(height: 8),
        Container(
          height: 44,
          child: TextField(
            controller: controller,
            decoration: _inputBorderStyle(),
          ),
        ),
      ],
    );
  }

  Widget _inputNumCnt(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _inputLabel(label),
        SizedBox(height: 8),
        Container(
          height: 44,
          child: Stack(
            alignment: Alignment.centerRight,
            children: [
              TextField(
                controller: controller,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  NumericInputFormatter(maxLength: 8),
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

  Widget _textareaCnt(String label, TextEditingController controller) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      _inputLabel(label),
      SizedBox(height: 8),
      Container(
        height: 150,
        child: TextField(
          controller: controller,
          maxLines: null,
          expands: true,
          maxLength: 100,
          decoration: _inputBorderStyle(),
        ),
      ),
    ]);
  }
}

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color backgroundColor;

  const PrimaryButton({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 0),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            // minimumSize: Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class NumericInputFormatter extends TextInputFormatter {
  final int maxLength;

  NumericInputFormatter({this.maxLength = 10});

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String text = newValue.text.replaceAll(RegExp(r'[^\d]'), ''); // 숫자만 필터링
    if (text.length > maxLength) {
      text = text.substring(0, maxLength); // 최대 길이 제한
    }

    final formatter = NumberFormat("#,###"); // 3자리마다 쉼표 추가
    String formattedText = formatter.format(int.tryParse(text) ?? 0);

    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }
}



// class NumericInputFormatter extends TextInputFormatter {
//   final int maxLength;
//   NumericInputFormatter({this.maxLength = 10});
//   @override
//   TextEditingValue formatEditUpdate(
//       TextEditingValue oldValue, TextEditingValue newValue) {
//     // 숫자만 허용, 3자리마다 쉼표 추가
//     String text = newValue.text.replaceAll(RegExp(r'[^\d]'), ''); // 숫자만 필터링
//     if (text.length > maxLength) {
//       text = text.substring(0, maxLength); // 최대 길이 제한
//     }
//     // 콤마 제거
//     String value = newValue.text.replaceAll(',', '');

//     // 숫자로 변환
//     int? number = int.tryParse(value);
//     if (number == null) {
//       return oldValue;
//     }

//     // 천 단위 콤마 추가
//     String formatted = number.toString().replaceAllMapped(
//         RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},');

//     return TextEditingValue(
//       text: formatted,
//       selection: TextSelection.collapsed(offset: formatted.length),
//     );
//   }
// }
