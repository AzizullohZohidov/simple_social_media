part of 'image_bloc.dart';

abstract class ImageState extends Equatable {
  const ImageState();

  @override
  List<Object> get props => [];
}

class ImageInitial extends ImageState {}

class ImageLoading extends ImageState {}

class ImageSuccess extends ImageState {
  final File image;

  const ImageSuccess(this.image);

  @override
  List<Object> get props => [image];
}

class ImageFailure extends ImageState {
  final String error;

  const ImageFailure(this.error);

  @override
  List<Object> get props => [error];
}
