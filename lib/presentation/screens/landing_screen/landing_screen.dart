import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class LandingScreen extends StatelessWidget {
  double outsideMargin = 5.0;
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
  LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 18.0,
                vertical: 30,
              ),
              child: Text(
                'Recently Added',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade900,
                ),
              ),
            ),
            Expanded(
              child: RefreshIndicator(
                onRefresh: () {
                  return Future.value();
                },
                child: StaggeredGridView.countBuilder(
                  padding: EdgeInsets.only(
                    left: outsideMargin,
                    right: outsideMargin,
                  ),
                  crossAxisCount: 4,
                  itemCount: photoUrls.length,
                  itemBuilder: (BuildContext context, int index) =>
                      _staggeredTile(photoUrls[index]),
                  staggeredTileBuilder: (int index) =>
                      const StaggeredTile.fit(2),
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                ),
              ),
            ),
          ],
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
}
