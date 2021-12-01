part of 'sign_up_bloc.dart';

abstract class SignUpState extends Equatable {
  const SignUpState();

  @override
  List<Object> get props => [];
}

class SignUpInitial extends SignUpState {}

class SignUpValidationError extends SignUpState {
  const SignUpValidationError({
    required this.emailError,
    required this.firstNameError,
    required this.lastNameError,
    required this.passwordError,
    required this.imageError,
  });

  final String emailError;
  final String firstNameError;
  final String lastNameError;
  final String passwordError;
  final String imageError;

  @override
  List<Object> get props => [
        emailError,
        firstNameError,
        lastNameError,
        passwordError,
        imageError,
      ];
}

class SignUpEmailErrorCleared extends SignUpState {}

class SignUpFirstNameErrorCleared extends SignUpState {}

class SignUpLastNameErrorCleared extends SignUpState {}

class SignUpPasswordErrorCleared extends SignUpState {}

class SignUpLoading extends SignUpState {}

class SignUpSubmissionSuccess extends SignUpState {}

class SignUpSubmissionFailure extends SignUpState {}
