import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:simple_social_media/business_logic/bloc/image_bloc/image_bloc.dart';

mixin ImageDialog {
  Future<void> showImageDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
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
                ),
                _buildDialogOptionButton(
                  context: context,
                  icon: Icons.image,
                  text: 'Gallery',
                  iconColor: Colors.deepOrange,
                  textColor: Colors.deepOrange,
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
  }) {
    return InkWell(
      onTap: () {
        BlocProvider.of<ImageBloc>(context).add(
          const ImageRequested(imageSource: ImageSource.camera),
        );
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
