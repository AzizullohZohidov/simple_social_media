import 'dart:io';

import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImageRepository {
  Future<File?> _pickImageCamOrGallery(ImageSource source) async {
    PickedFile? pickedFile;
    var xPhoto = await ImagePicker().pickImage(
      source: source,
      maxHeight: 1080,
      maxWidth: 1080,
    );
    if (xPhoto != null) {
      pickedFile = PickedFile(xPhoto.path);
      var _croppedImage = await _cropImage(pickedFile.path);
      return _croppedImage;
    }
  }

  Future<File?> pickImageFromGallery() async {
    return await _pickImageCamOrGallery(ImageSource.gallery);
  }

  Future<File?> takePhoto() async {
    return await _pickImageCamOrGallery(ImageSource.camera);
  }

  Future<File?> _cropImage(filePath) async {
    File? croppedImage = await ImageCropper.cropImage(
      sourcePath: filePath,
      maxHeight: 1080,
      maxWidth: 1080,
    );
    return croppedImage;
  }
}
