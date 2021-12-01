import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:simple_social_media/business_logic/bloc/image_bloc/image_bloc.dart';

mixin ImageDialogMixin {
  void showImageDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: const Text('Please choose an option'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildDialogOptionButton(
                  context: context,
                  icon: Icons.camera,
                  text: 'Camera',
                  iconColor: Colors.deepOrange,
                  textColor: Colors.deepOrange,
                  source: ImageSource.camera,
                ),
                _buildDialogOptionButton(
                  context: context,
                  icon: Icons.image,
                  text: 'Gallery',
                  iconColor: Colors.deepOrange,
                  textColor: Colors.deepOrange,
                  source: ImageSource.gallery,
                ),
              ],
            ),
          );
        });
  }

  Widget _buildDialogOptionButton({
    required BuildContext context,
    required IconData icon,
    required String text,
    required Color iconColor,
    required Color textColor,
    required ImageSource source,
  }) {
    return InkWell(
      onTap: () {
        BlocProvider.of<ImageBloc>(context).add(
          ImageRequested(imageSource: source),
        );
        Navigator.pop(context);
      },
      child: _buildIconText(
        icon,
        text,
        iconColor,
        textColor,
      ),
    );
  }

  Widget _buildIconText(
    IconData icon,
    String text,
    Color iconColor,
    Color textColor,
  ) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Icon(
            icon,
            color: iconColor,
          ),
        ),
        Text(
          text,
          style: TextStyle(
            color: textColor,
          ),
        ),
      ],
    );
  }
}
