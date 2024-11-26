import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddImageScreen extends StatefulWidget {
  final Function(bool) onImageAttached;

  const AddImageScreen({super.key, required this.onImageAttached});

  @override
  AddImageScreenState createState() => AddImageScreenState();
}

class AddImageScreenState extends State<AddImageScreen> {
  final ImagePicker _picker = ImagePicker();
  XFile? _image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      decoration: BoxDecoration(
        color: Color(0xFFF7F7F7),
        borderRadius: BorderRadius.circular(4),
      ),
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
            Stack(
              children: [
                Positioned(
                  top: 80,
                  left: 0,
                  right: 0,
                  child: Icon(
                    Icons.add_circle,
                    size: 50,
                    color: Colors.grey,
                  ),
                ),
                Positioned(
                  bottom: 70,
                  left: 0,
                  right: 0,
                  child: Text(
                    '이미지를 추가해주세요.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ],
            ),
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () async {
                  final XFile? pickedFile =
                      await _picker.pickImage(source: ImageSource.gallery);
                  setState(() {
                    _image = pickedFile;
                    final imgPath = _image?.path; //이미지를 가져오는 방법 중 하나

                    print('dddd: ${_image?.path}');
                    widget.onImageAttached(_image != null);
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
