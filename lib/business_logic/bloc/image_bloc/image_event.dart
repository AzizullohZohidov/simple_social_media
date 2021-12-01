part of 'image_bloc.dart';

abstract class ImageEvent extends Equatable {
  const ImageEvent();

  @override
  List<Object> get props => [];
}

class ImageRequested extends ImageEvent {
  final ImageSource imageSource;

  const ImageRequested({required this.imageSource});

  @override
  List<Object> get props => [];
}
