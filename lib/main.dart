import 'package:deepdive_application/pages/detail/item_detail_page.dart';
import 'package:deepdive_application/pages/intro_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: Color(0xFF338BEF), // 커서 색상을 파란색으로 설정
        ),
      ),
      // home: IntroPage(),
      // 나머지 앱 설정
    );
  }
}
