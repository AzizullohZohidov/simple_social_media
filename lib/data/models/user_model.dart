import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String id;
  final String email;
  final String firstName;
  final String lastName;
  final String createdAt;

  UserModel({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.createdAt,
  });

  UserModel.empty({
    this.id = '',
    this.email = '',
    this.firstName = '',
    this.lastName = '',
    this.createdAt = '',
  });

  @override
  List<Object?> get props => [id, email, firstName, lastName, createdAt];
}
