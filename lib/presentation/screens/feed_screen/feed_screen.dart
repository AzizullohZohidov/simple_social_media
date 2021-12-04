import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../widgets/title_text.dart';

class FeedScreen extends StatelessWidget {
  List<String> photoUrls = [
    'https://cdn.pixabay.com/photo/2016/06/02/02/33/triangles-1430105_1280.png',
    'https://cdn.pixabay.com/photo/2020/07/03/16/51/mountains-5367026_1280.jpg',
    'https://cdn.pixabay.com/photo/2021/08/02/17/56/lighthouse-6517457_1280.jpg',
    'https://cdn.pixabay.com/photo/2020/06/28/04/07/cat-5347790_1280.jpg',
    'https://cdn.pixabay.com/photo/2016/04/18/22/05/seashells-1337565_1280.jpg',
    'https://cdn.pixabay.com/photo/2020/07/03/16/51/sunrise-5367028_1280.jpg',
    'https://cdn.pixabay.com/photo/2017/06/23/17/46/desert-2435404_1280.jpg',
    'https://cdn.pixabay.com/photo/2020/07/01/23/22/red-rocks-5361244_1280.jpg',
    'https://cdn.pixabay.com/photo/2016/09/29/13/08/planet-1702788_1280.jpg',
    'https://cdn.pixabay.com/photo/2011/12/14/12/21/orion-nebula-11107_1280.jpg',
  ];

  double tileCornerRadius = 15;

  FeedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildBlurredAppBar(context),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildImageGrid(),
          ],
        ),
      ),
    );
  }

  Widget _buildImageGrid() {
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
          itemBuilder: (BuildContext context, int index) =>
              _staggeredTile(photoUrls[index]),
          staggeredTileBuilder: (int index) => const StaggeredTile.fit(2),
          mainAxisSpacing: 12.0,
          crossAxisSpacing: 12.0,
        ),
      ),
    );
  }

  Widget _staggeredTile(String photoUrl) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(tileCornerRadius),
      child: Image.network(
        photoUrl,
        fit: BoxFit.cover,
      ),
    );
  }

  PreferredSize _buildBlurredAppBar(BuildContext context) {
    return PreferredSize(
      child: Container(
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 5,
              sigmaY: 50,
              tileMode: TileMode.repeated,
            ),
            child: Container(
              //   width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).padding.top + 100,
              //Colors.transparent gives only blurring while Colors.white70 matte looking effect
              color: Colors.white70,
              child: SafeArea(
                child: Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.symmetric(horizontal: 28),
                  child: const TitleText(
                    text: 'Recently Added',
                    fontWeight: FontWeight.bold,
                    textColor: Colors.deepOrange,
                    textSize: 24,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      preferredSize: Size(MediaQuery.of(context).size.width, 80),
    );
  }
}
