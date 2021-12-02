part of 'add_pin_bloc.dart';

abstract class AddPinState extends Equatable {
  const AddPinState();

  @override
  List<Object> get props => [];
}

class AddPinInitial extends AddPinState {}

class AddPinLoading extends AddPinState {}

class AddPinSuccess extends AddPinState {}

class AddPinValidationError extends AddPinState {
  final String pinImageError;
  final String pinNameError;
  final String pinDescriptionError;

  const AddPinValidationError({
    required this.pinImageError,
    required this.pinNameError,
    required this.pinDescriptionError,
  });
}

class AddPinFailure extends AddPinState {}
