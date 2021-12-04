import 'package:flutter/material.dart';

class StaggeredTile extends StatelessWidget {
  const StaggeredTile({
    Key? key,
    required this.tileCornerRadius,
    required this.photoUrl,
  }) : super(key: key);

  final double tileCornerRadius;
  final String photoUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(tileCornerRadius),
      child: Image.network(
        photoUrl,
        fit: BoxFit.cover,
      ),
    );
  }
}
