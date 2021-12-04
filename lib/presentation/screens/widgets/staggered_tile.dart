import 'package:flutter/material.dart';
import 'package:simple_social_media/data/models/pin_model.dart';

class StaggeredTile extends StatelessWidget {
  const StaggeredTile({
    Key? key,
    required this.tileCornerRadius,
    required this.pin,
    this.rightPadding = 0,
    this.leftPadding = 0,
    this.topPadding = 0,
    this.bottomPadding = 0,
  }) : super(key: key);

  final double tileCornerRadius;
  final double rightPadding;
  final double leftPadding;
  final double topPadding;
  final double bottomPadding;
  final PinModel pin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: rightPadding,
        left: leftPadding,
        top: topPadding,
        bottom: bottomPadding,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(tileCornerRadius),
        child: Image.network(
          pin.pinImageUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
