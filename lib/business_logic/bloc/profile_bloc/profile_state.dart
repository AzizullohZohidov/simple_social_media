part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class ProfileInitial extends ProfileState {
  const ProfileInitial();
}

class ProfileInitialization extends ProfileState {
  const ProfileInitialization({required this.currentUser});

  final UserModel currentUser;

  @override
  List<Object> get props => [currentUser];
}

class ProfileRefreshed extends ProfileState {
  const ProfileRefreshed({required this.currentUser});

  final UserModel currentUser;

  @override
  List<Object> get props => [currentUser];
}
