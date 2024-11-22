import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  TestScreenState createState() => TestScreenState();
}

class TestScreenState extends State<TestScreen> {
  final ImagePicker _picker = ImagePicker();
  XFile? _image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Scaffold(
        body: Center(
          child: _image == null
              ? const Text('No image selected.')
              : Image.file(File(_image!.path)), // 선택된 이미지 표시
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            // 갤러리에서 이미지 선택
            final XFile? pickedFile =
                await _picker.pickImage(source: ImageSource.gallery);
            if (pickedFile != null) {
              setState(() {
                _image = pickedFile; // 선택된 이미지를 상태에 저장
              });
            }
          },
          child: const Icon(Icons.photo),
        ),
      ),
    );
  }
}
