part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class ProfileInitializationRequested extends ProfileEvent {
  const ProfileInitializationRequested();

  @override
  List<Object> get props => [];
}

class ProfileRefreshingRequested extends ProfileEvent {
  const ProfileRefreshingRequested();

  @override
  List<Object> get props => [];
}
