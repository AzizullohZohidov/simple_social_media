import 'package:flutter/material.dart';
import 'components/post_description.dart';
import 'components/post_image_return_button.dart';
import 'components/separator.dart';
import '../widgets/title_text.dart';

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
                    TitleText(
                      text: title,
                      fontWeight: FontWeight.w500,
                      textColor: Colors.black,
                      textSize: 24,
                      verticalPadding: 12.5,
                    ),
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
