import 'package:flutter/material.dart';

class PostImageReturnButton extends StatelessWidget {
  final String imageUrl;
  const PostImageReturnButton({Key? key, required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          imageUrl,
          fit: BoxFit.fitWidth,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 15,
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back_ios_rounded,
              size: 35,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
