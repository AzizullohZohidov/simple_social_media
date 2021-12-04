import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:simple_social_media/presentation/screens/widgets/staggered_tile.dart'
    as svw;

class ImagesGrid extends StatelessWidget {
  const ImagesGrid({
    Key? key,
    required this.photoUrls,
    required this.tileCornerRadius,
  }) : super(key: key);

  final List<String> photoUrls;
  final double tileCornerRadius;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RefreshIndicator(
        onRefresh: () {
          return Future.value();
        },
        child: StaggeredGridView.countBuilder(
          padding: const EdgeInsets.only(
            top: 24,
            left: 24,
            right: 24,
          ),
          crossAxisCount: 4,
          itemCount: photoUrls.length,
          itemBuilder: (BuildContext context, int index) => svw.StaggeredTile(
            tileCornerRadius: tileCornerRadius,
            photoUrl: photoUrls[index],
          ),
          staggeredTileBuilder: (int index) => const StaggeredTile.fit(2),
          mainAxisSpacing: 12.0,
          crossAxisSpacing: 12.0,
        ),
      ),
    );
  }
}
