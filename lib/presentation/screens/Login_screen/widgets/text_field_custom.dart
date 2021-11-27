import 'package:flutter/material.dart';

class TextFieldCustom extends StatelessWidget {
  final TextEditingController controller;
  final double fieldLength;
  final String label;
  final double labelSize;
  final bool isObscured;
  final Color fieldColor;
  final double leftMargin;
  final double rightMargin;
  final double topMargin;
  final double bottomMargin;
  final String errorText;
  const TextFieldCustom({
    Key? key,
    required this.controller,
    required this.fieldLength,
    required this.label,
    this.labelSize = 14,
    this.isObscured = false,
    this.fieldColor = Colors.grey,
    this.leftMargin = 0,
    this.rightMargin = 0,
    this.topMargin = 0,
    this.bottomMargin = 0,
    this.errorText = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: fieldLength,
      margin: EdgeInsets.only(
        left: leftMargin,
        right: rightMargin,
        top: topMargin,
        bottom: bottomMargin,
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          fillColor: fieldColor,
          focusColor: fieldColor,
          hoverColor: fieldColor,
          label: Text(
            label,
            style: TextStyle(
              color: fieldColor,
              fontSize: labelSize,
            ),
          ),
          errorText: errorText,
        ),
        cursorColor: fieldColor,
        obscureText: isObscured,
      ),
    );
  }
}
