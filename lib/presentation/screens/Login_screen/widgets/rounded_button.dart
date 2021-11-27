import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final double height;
  final double width;
  final String buttonText;
  final double textSize;
  final Color textColor;
  final bool isBold;
  final double radius;
  final Color buttonColor;
  final bool isEnabled;
  final Function callback;
  const RoundedButton({
    Key? key,
    required this.height,
    this.width = double.infinity,
    required this.buttonText,
    this.textSize = 16,
    this.textColor = Colors.white,
    this.isBold = false,
    this.radius = 45,
    this.buttonColor = Colors.deepOrange,
    required this.isEnabled,
    required this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isEnabled ? () => callback : null,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: buttonColor,
        ),
        child: Text(
          buttonText,
          style: TextStyle(
            fontSize: textSize,
            color: textColor,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
