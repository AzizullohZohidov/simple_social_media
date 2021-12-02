import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:simple_social_media/business_logic/bloc/add_pin_bloc/add_pin_bloc.dart';
import 'package:simple_social_media/business_logic/bloc/image_bloc/image_bloc.dart';
import 'package:simple_social_media/presentation/screens/widgets/image_dialog_mixin.dart';
import '../widgets/rounded_button.dart';
import '../widgets/text_field_custom.dart';
import '../widgets/title_text.dart';

class AddPinScreen extends StatelessWidget with ImageDialogMixin {
  late ImageBloc imageBloc;
  late AddPinBloc addPinBloc;
  File? pinImage;
  AddPinScreen({Key? key}) : super(key: key);
  var pinNameController = TextEditingController();
  var pinDescriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var phoneSize = MediaQuery.of(context).size;
    imageBloc = BlocProvider.of<ImageBloc>(context);
    addPinBloc = BlocProvider.of<AddPinBloc>(context);
    return Scaffold(
      appBar: _buildAppBar(context),
      body: MultiBlocListener(
        listeners: [
          BlocListener<AddPinBloc, AddPinState>(
            listener: (context, state) {
              if (state is AddPinSuccess) {
                Navigator.of(context).pop();
              } else if (state is AddPinValidationError &&
                  state.pinImageError != '') {
                Fluttertoast.cancel();
                Fluttertoast.showToast(msg: state.pinImageError);
              }
            },
          ),
          BlocListener<ImageBloc, ImageState>(
            listener: (context, state) {
              if (state is ImageSuccess) {
                pinImage = state.image;
              }
            },
          ),
        ],
        child: Align(
          alignment: Alignment.topCenter,
          child: SizedBox(
            width: phoneSize.width * 0.85,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  BlocBuilder<ImageBloc, ImageState>(
                    builder: (context, state) {
                      return _buildPickImage(
                        context: context,
                        imageFile: state is ImageSuccess ? state.image : null,
                        phoneSize: phoneSize,
                        radius: 15,
                      );
                    },
                  ),
                  const SizedBox(height: 30),
                  BlocBuilder<AddPinBloc, AddPinState>(
                    builder: (context, state) {
                      return TextFieldCustom(
                        controller: pinNameController,
                        fieldLength: double.infinity,
                        label: 'Post Name',
                        isCapitalized: true,
                        errorText: pinNameError(state),
                      );
                    },
                  ),
                  const SizedBox(height: 15),
                  BlocBuilder<AddPinBloc, AddPinState>(
                    builder: (context, state) {
                      return TextFieldCustom(
                        controller: pinDescriptionController,
                        fieldLength: double.infinity,
                        label: 'Post Description',
                        isCapitalized: true,
                        isMultiline: true,
                        errorText: pinDescriptionError(state),
                      );
                    },
                  ),
                  const SizedBox(height: 30),
                  BlocBuilder<AddPinBloc, AddPinState>(
                    builder: (context, state) {
                      if (state is AddPinLoading) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      return RoundedButton(
                        height: phoneSize.height * 0.075,
                        width: phoneSize.width * 0.6,
                        buttonText: 'Create',
                        isEnabled: true,
                        callback: () {
                          addPinBloc.add(
                            AddPinSubmitted(
                              pinImageFile: pinImage!,
                              pinName: pinNameController.text,
                              pinDescription: pinDescriptionController.text,
                            ),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leading: Navigator.of(context).canPop()
          ? IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () => Navigator.of(context).pop(),
            )
          : null,
      title: const TitleText(
        text: 'Create Post',
        fontWeight: FontWeight.bold,
        textColor: Colors.deepOrange,
        textSize: 24,
      ),
      backgroundColor: Colors.white10,
      systemOverlayStyle:
          SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.white10),
      elevation: 0,
    );
  }

  Widget _buildPickImage({
    required BuildContext context,
    File? imageFile,
    required Size phoneSize,
    required double radius,
  }) {
    return GestureDetector(
      onTap: () {
        showImageDialog(context);
      },
      child: Container(
        margin: const EdgeInsets.only(
          top: 10,
        ),
        constraints: BoxConstraints(maxHeight: phoneSize.height * 0.5),
        child: imageFile != null
            ? _buildImage(imageFile, radius)
            : _buildAddImagePlaceholder(),
      ),
    );
  }

  Widget _buildImage(File imageFile, double radius) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: Image.file(
          imageFile,
          fit: BoxFit.fitWidth,
        ));
  }

  Widget _buildAddImagePlaceholder() {
    print('Build placeholder again');
    return DottedBorder(
      borderType: BorderType.RRect,
      strokeWidth: 3,
      strokeCap: StrokeCap.round,
      dashPattern: const [20],
      radius: const Radius.circular(30),
      color: Colors.grey,
      child: const Center(
        child: Icon(
          Icons.add_rounded,
          size: 100,
          color: Colors.grey,
        ),
      ),
    );
  }

  String? pinNameError(AddPinState state) {
    if (state is AddPinValidationError && state.pinNameError != '') {
      return state.pinNameError;
    }
    return null;
  }

  String? pinDescriptionError(AddPinState state) {
    if (state is AddPinValidationError && state.pinDescriptionError != '') {
      return state.pinDescriptionError;
    }
    return null;
  }
}
