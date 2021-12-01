import 'dart:io';

mixin IsImageNullMixin {
  String isImageNull(File? image) {
    if (image == null) {
      return 'Please provide a profile picture';
    }
    return '';
  }
}
