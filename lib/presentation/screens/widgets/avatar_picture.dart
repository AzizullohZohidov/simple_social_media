import 'package:flutter/material.dart';

class AvatarPicture extends StatelessWidget {
  const AvatarPicture({
    Key? key,
    required this.avatarImagePath,
    required this.radius,
    this.outlineWidth = 4,
    this.topMargin = 0,
    this.rightMargin = 0,
    this.bottomMargin = 0,
    this.leftMargin = 0,
  }) : super(key: key);
  final String avatarImagePath;
  final double radius;
  final double outlineWidth;
  final double topMargin;
  final double rightMargin;
  final double bottomMargin;
  final double leftMargin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: topMargin,
        right: rightMargin,
        bottom: bottomMargin,
        left: leftMargin,
      ),
      height: 2 * radius,
      width: 2 * radius,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: NetworkImage(avatarImagePath),
          fit: BoxFit.cover,
        ),
        border: Border.all(width: outlineWidth, color: Colors.white),
        boxShadow: const [
          BoxShadow(
            blurRadius: 1,
            spreadRadius: 1,
            color: Colors.black54,
          ),
        ],
      ),
    );
  }
}
