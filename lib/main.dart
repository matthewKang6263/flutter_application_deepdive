import 'package:deepdive_application/pages/intro_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Pretendard', //지정폰트 세팅 : 에셋에 폰트 생성, yaml파일에도 활성화
      ),
      home: IntroPage(),
    );
  }
}
