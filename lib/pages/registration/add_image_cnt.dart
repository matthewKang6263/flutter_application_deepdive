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
      child: Stack(
        children: [
          if (_image != null)
            Image.file(
              File(_image!.path),
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            )
          else
            const Center(child: Text('이미지를 추가해주세요.')),
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () async {
                  final XFile? pickedFile =
                      await _picker.pickImage(source: ImageSource.gallery);
                  if (pickedFile != null) {
                    setState(() {
                      _image = pickedFile;
                    });
                  }
                },
                child: _image == null
                    ? const Icon(Icons.add_photo_alternate, size: 50)
                    : Container(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
