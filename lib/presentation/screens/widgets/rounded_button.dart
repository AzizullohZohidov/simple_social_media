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
  final Color splashColor;
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
    this.buttonColor = Colors.red,
    this.splashColor = Colors.redAccent,
    required this.isEnabled,
    required this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Ink(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: isEnabled ? buttonColor : Colors.grey.shade300,
          borderRadius: BorderRadius.circular(radius),
        ),
        child: InkWell(
          onTap: isEnabled ? () => callback : null,
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
          child: Center(
            child: Text(
              buttonText,
              style: TextStyle(
                fontSize: textSize,
                color: isEnabled ? textColor : Colors.grey,
                fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
          splashColor: splashColor,
        ),
      ),
    );
  }
}
