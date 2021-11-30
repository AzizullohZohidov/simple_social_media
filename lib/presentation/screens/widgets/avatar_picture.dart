import 'package:flutter/material.dart';

class AvatarPicture extends StatelessWidget {
  const AvatarPicture({
    Key? key,
    required this.avatarImagePath,
    required this.radius,
  }) : super(key: key);
  final String avatarImagePath;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 2 * radius,
      width: 2 * radius,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: NetworkImage(avatarImagePath),
          fit: BoxFit.cover,
        ),
        border: Border.all(width: 4, color: Colors.white),
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
