import 'package:flutter/material.dart';

class PostDescription extends StatelessWidget {
  final String description;
  final double verticalPadding;
  const PostDescription({
    Key? key,
    required this.description,
    this.verticalPadding = 12.5,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: verticalPadding),
      child: Text(
        description,
        style: const TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }
}
