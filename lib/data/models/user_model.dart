import 'package:equatable/equatable.dart';
import 'package:simple_social_media/data/models/pin_model.dart';

class UserModel extends Equatable {
  final String id;
  final String email;
  final String firstName;
  final String lastName;
  final String createdAt;
  final List<PinModel> userPins;
  final String userProfileImageUrl;

  UserModel(
      {required this.id,
      required this.email,
      required this.firstName,
      required this.lastName,
      required this.createdAt,
      required this.userPins,
      required this.userProfileImageUrl});

  UserModel.empty({
    this.id = '',
    this.email = '',
    this.firstName = '',
    this.lastName = '',
    this.createdAt = '',
    this.userPins = const [],
    this.userProfileImageUrl = '',
  });

  @override
  List<Object?> get props => [
        id,
        email,
        firstName,
        lastName,
        createdAt,
        userPins,
        userProfileImageUrl,
      ];
}
