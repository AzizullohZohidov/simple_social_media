import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:simple_social_media/data/models/pin_model.dart';
import 'package:simple_social_media/presentation/screens/widgets/staggered_tile.dart'
    as svw;

class ImagesGrid extends StatelessWidget {
  const ImagesGrid({
    Key? key,
    required this.pins,
    required this.tileCornerRadius,
    this.needPrefixWidget = false,
    this.prefixWidget = const SizedBox(),
  }) : super(key: key);

  final List<PinModel> pins;
  final double tileCornerRadius;
  final Widget prefixWidget;
  final bool needPrefixWidget;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () {
        return Future.value();
      },
      child: StaggeredGridView.countBuilder(
        padding: const EdgeInsets.only(
          top: 24, //later to be replaced by dynamic calculation
          left: 24,
          right: 24,
        ),
        crossAxisCount: 4,
        itemCount: needPrefixWidget ? pins.length + 1 : pins.length,
        itemBuilder: (BuildContext context, int index) {
          if (needPrefixWidget && index == 0) {
            return prefixWidget;
          }
          return svw.StaggeredTile(
            tileCornerRadius: tileCornerRadius,
            pin: needPrefixWidget ? pins[index - 1] : pins[index],
          );
        },
        staggeredTileBuilder: (int index) {
          if (needPrefixWidget && index == 0) {
            return const StaggeredTile.fit(4);
          }
          return const StaggeredTile.fit(2);
        },
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
      ),
    );
  }
}
