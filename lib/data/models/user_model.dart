import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String id;
  final String email;
  final String firstName;
  final String lastName;
  final String createdAt;
  final List<String> pinImageIds;
  final String userProfileImageUrl;

  UserModel(
      {required this.id,
      required this.email,
      required this.firstName,
      required this.lastName,
      required this.createdAt,
      required this.pinImageIds,
      required this.userProfileImageUrl});

  UserModel.empty({
    this.id = '',
    this.email = '',
    this.firstName = '',
    this.lastName = '',
    this.createdAt = '',
    this.pinImageIds = const [],
    this.userProfileImageUrl = '',
  });

  @override
  List<Object?> get props => [
        id,
        email,
        firstName,
        lastName,
        createdAt,
        pinImageIds,
        userProfileImageUrl,
      ];
}
