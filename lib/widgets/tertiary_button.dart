import 'package:flutter/material.dart';

class TertiaryButton extends StatelessWidget {
  final String text; // 버튼에 표시될 텍스트
  final IconData? icon;
  final Color? iconColor;
  final Color? textColor;
  final double? fontSize;
  final VoidCallback onPressed; // 버튼 클릭 시 실행할 함수

  const TertiaryButton({
    Key? key,
    required this.text,
    this.icon,
    required this.onPressed,
    this.iconColor = const Color(0xFF8A8A8A),
    this.textColor = const Color(0xFF5c5c5c),
    this.fontSize = 16,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
          side: BorderSide(color: Color(0xffd9d9d9)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null) ...[
            Icon(
              icon,
              size: 24,
              color: iconColor,
            ),
            SizedBox(
              width: 8,
            )
          ],
          Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: fontSize,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
