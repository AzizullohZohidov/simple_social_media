import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/rounded_button.dart';
import '../widgets/text_field_custom.dart';
import '../widgets/title_text.dart';

class AddPinScreen extends StatelessWidget {
  AddPinScreen({Key? key}) : super(key: key);
  var pinNameController = TextEditingController();
  var pinDescriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var phoneSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Align(
        alignment: Alignment.topCenter,
        child: SizedBox(
          width: phoneSize.width * 0.85,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildPickImage(
                  'https://cdn.pixabay.com/photo/2020/06/28/04/07/cat-5347790_1280.jpg',
                  //null,
                  phoneSize,
                  15,
                ),
                const SizedBox(height: 30),
                TextFieldCustom(
                  controller: pinNameController,
                  fieldLength: double.infinity,
                  label: 'Post Name',
                  isCapitalized: true,
                ),
                const SizedBox(height: 15),
                TextFieldCustom(
                  controller: pinDescriptionController,
                  fieldLength: double.infinity,
                  label: 'Post Description',
                  isCapitalized: true,
                  isMultiline: true,
                ),
                const SizedBox(height: 30),
                RoundedButton(
                  height: phoneSize.height * 0.075,
                  width: phoneSize.width * 0.6,
                  buttonText: 'Create',
                  isEnabled: true,
                  callback: () {},
                ),
              ],
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

  Widget _buildPickImage(String? imageUrl, Size phoneSize, double radius) {
    return Container(
      margin: const EdgeInsets.only(
        top: 10,
      ),
      height: phoneSize.height * 0.5,
      child: imageUrl == null
          ? _buildAddImagePlaceholder()
          : _buildImage(imageUrl, radius),
    );
  }

  Widget _buildImage(String imageUrl, double radius) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: Image.network(
          imageUrl,
          fit: BoxFit.fitHeight,
        ));
  }

  Widget _buildAddImagePlaceholder() {
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
}
