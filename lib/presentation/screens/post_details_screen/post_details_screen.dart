import 'package:flutter/material.dart';
import 'package:simple_social_media/presentation/screens/post_details_screen/components/post_description.dart';
import 'package:simple_social_media/presentation/screens/post_details_screen/components/post_image_return_button.dart';
import 'package:simple_social_media/presentation/screens/post_details_screen/components/post_title.dart';
import 'package:simple_social_media/presentation/screens/post_details_screen/components/separator.dart';

class PostDetailsScreen extends StatelessWidget {
  //final String publisherId;
  final String imageUrl;
  final String title;
  final String description;
  //final String createdAt;
  const PostDetailsScreen({
    Key? key,
    //required this.publisherId,
    required this.imageUrl,
    required this.title,
    required this.description,
    //required this.createdAt,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              PostImageReturnButton(imageUrl: imageUrl),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PostTitle(title: title),
                    const Separator(),
                    PostDescription(description: description),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
