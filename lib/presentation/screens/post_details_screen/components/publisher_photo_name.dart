import 'package:flutter/material.dart';
import 'package:simple_social_media/presentation/screens/widgets/avatar_picture.dart';
import 'package:simple_social_media/presentation/screens/widgets/title_text.dart';

class PublisherPhotoName extends StatelessWidget {
  final String publisherImageUrl;
  final String publisherFirstName;
  final String publisherLastName;
  const PublisherPhotoName({
    Key? key,
    required this.publisherImageUrl,
    required this.publisherFirstName,
    required this.publisherLastName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AvatarPicture(
          topMargin: 15,
          bottomMargin: 15,
          rightMargin: 15,
          avatarImagePath: publisherImageUrl,
          radius: 30,
          outlineWidth: 2,
        ),
        TitleText(
          text: publisherFirstName + ' ' + publisherLastName,
          fontWeight: FontWeight.w500,
          textColor: Colors.black,
          textSize: 16,
        ),
      ],
    );
  }
}
