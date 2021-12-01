import 'dart:io';

import 'package:flutter/material.dart';
import 'package:simple_social_media/presentation/screens/widgets/avatar_picture.dart';
import 'package:simple_social_media/presentation/screens/widgets/image_dialog_mixin.dart';

class PickAvatarImage extends StatelessWidget with ImageDialogMixin {
  final double radius;
  File? avatarImageFile;
  PickAvatarImage({
    Key? key,
    required this.radius,
    this.avatarImageFile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showImageDialog(context);
      },
      child: avatarImageFile != null
          ? AvatarPicture.fromFile(
              imageFile: avatarImageFile!,
              radius: radius,
            )
          : AvatarPicture(
              avatarImagePath:
                  'https://drjollydiagnostics.com/wp-content/uploads/2017/11/profile-placeholder.png',
              radius: radius,
              outlineWidth: 3,
            ),
    );
  }
}
