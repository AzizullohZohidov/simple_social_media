import 'package:flutter/material.dart';

class DescriptionText extends StatelessWidget {
  final String text;
  final bool isBold;
  final Color textColor;
  final double textSize;
  final double fieldWidth;
  const DescriptionText({
    Key? key,
    required this.text,
    required this.isBold,
    required this.textColor,
    required this.textSize,
    required this.fieldWidth,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: fieldWidth,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          color: textColor,
          fontSize: textSize,
        ),
      ),
    );
  }
}
