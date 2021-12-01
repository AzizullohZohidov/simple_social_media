import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:simple_social_media/data/repositories/image_repository.dart';

part 'image_event.dart';
part 'image_state.dart';

class ImageBloc extends Bloc<ImageEvent, ImageState> {
  ImageBloc({required this.imageRepository}) : super(ImageInitial()) {
    on<ImageRequested>(_onImageRequested);
  }
  final ImageRepository imageRepository;

  void _onImageRequested(ImageRequested event, Emitter<ImageState> emit) async {
    try {
      print('Image request came');
      File? imageFile;
      if (event.imageSource == ImageSource.camera) {
        imageFile = await imageRepository.takePhoto();
      } else {
        imageFile = await imageRepository.pickImageFromGallery();
      }
      if (imageFile != null) {
        emit(ImageSuccess(imageFile));
        print('image is emitted');
        return;
      }
    } catch (error) {
      emit(const ImageFailure('Something'));
    }
  }
}
