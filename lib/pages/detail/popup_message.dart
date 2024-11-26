

class PopupMessage extends StatelessWidget {
  final String message; // 알림 메시지 텍스트

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 350, // Hug Width
        constraints: BoxConstraints(maxWidth: 312), // 최대 너비
        height: 45, // Hug Height
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16), // 내부 패딩
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.8), // 배경색
          borderRadius: BorderRadius.circular(8), // 모서리 둥글기
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [