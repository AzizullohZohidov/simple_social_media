import 'dart:io';

import 'package:flutter/material.dart';

class AvatarPicture extends StatelessWidget {
  AvatarPicture({
    Key? key,
    required this.avatarImagePath,
    required this.radius,
    this.outlineWidth = 4,
    this.topMargin = 0,
    this.rightMargin = 0,
    this.bottomMargin = 0,
    this.leftMargin = 0,
  }) : super(key: key) {
    fromFile = false;
  }

  AvatarPicture.fromFile({
    Key? key,
    required this.radius,
    required this.imageFile,
    this.outlineWidth = 4,
    this.topMargin = 0,
    this.rightMargin = 0,
    this.bottomMargin = 0,
    this.leftMargin = 0,
  }) : super(key: key) {
    fromFile = true;
  }
  late String avatarImagePath;
  final double radius;
  late File imageFile;
  final double outlineWidth;
  final double topMargin;
  final double rightMargin;
  final double bottomMargin;
  final double leftMargin;
  late bool fromFile;

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
          image: imageBasedOnFromFile(fromFile),
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

  ImageProvider imageBasedOnFromFile(bool fromFile) {
    if (fromFile) {
      return FileImage(imageFile);
    } else {
      return NetworkImage(avatarImagePath);
    }
  }
}
