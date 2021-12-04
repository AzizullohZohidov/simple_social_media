import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_social_media/business_logic/bloc/feed_bloc/feed_bloc.dart';
import 'package:simple_social_media/presentation/screens/widgets/images_grid.dart';
import '../widgets/title_text.dart';

class FeedScreen extends StatefulWidget {
  late FeedBloc feedBloc;

  FeedScreen({Key? key}) : super(key: key);

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  void initState() {
    widget.feedBloc = BlocProvider.of<FeedBloc>(context);
    widget.feedBloc.add(FeedInitializationRequested());
    super.initState();
  }

  double tileCornerRadius = 15;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildBlurredAppBar(context),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<FeedBloc, FeedState>(builder: (context, state) {
              return _buildBody(state);
            }),
          ],
        ),
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

  Widget _buildBody(FeedState state) {
    if (state is FeedInitialization) {
      if (state.allPins.isEmpty) {
        return const Expanded(
            child: Center(child: Text('No posts found. Be first to post!')));
      }
      return Expanded(
        child:
            ImagesGrid(pins: state.allPins, tileCornerRadius: tileCornerRadius),
      );
    }
    return const Expanded(child: Center(child: CircularProgressIndicator()));
  }
}
