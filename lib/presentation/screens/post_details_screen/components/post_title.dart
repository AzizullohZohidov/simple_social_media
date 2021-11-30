import 'package:flutter/material.dart';

class PostTitle extends StatelessWidget {
  final String title;
  final double verticalPadding;
  const PostTitle({
    Key? key,
    required this.title,
    this.verticalPadding = 12.5,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: verticalPadding),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
