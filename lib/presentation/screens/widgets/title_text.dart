import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  final String text;
  final FontWeight fontWeight;
  final Color textColor;
  final double textSize;
  final double verticalPadding;
  final double horizontalPadding;
  const TitleText({
    Key? key,
    required this.text,
    required this.fontWeight,
    required this.textColor,
    required this.textSize,
    this.verticalPadding = 0,
    this.horizontalPadding = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: verticalPadding,
      ),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: fontWeight,
          color: textColor,
          fontSize: textSize,
        ),
      ),
    );
  }
}
