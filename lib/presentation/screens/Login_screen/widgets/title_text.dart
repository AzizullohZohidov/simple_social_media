import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  final String text;
  final bool isBold;
  final Color textColor;
  final double textSize;
  const TitleText({
    Key? key,
    required this.text,
    required this.isBold,
    required this.textColor,
    required this.textSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
        color: textColor,
        fontSize: textSize,
      ),
    );
  }
}
