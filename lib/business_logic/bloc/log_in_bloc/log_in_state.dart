part of 'log_in_bloc.dart';

abstract class LogInState extends Equatable {
  const LogInState();

  @override
  List<Object> get props => [];
}

class LogInInitial extends LogInState {}

class LogInValidationError extends LogInState {
  const LogInValidationError({
    required this.emailError,
    required this.passwordError,
  });

  final String emailError;
  final String passwordError;

  @override
  List<Object> get props => [
        emailError,
        passwordError,
      ];
}

class LogInLoading extends LogInState {}

class LogInSubmissionSuccess extends LogInState {}

class LogInSubmissionFailure extends LogInState {}
