part of 'sign_up_bloc.dart';

/*class SignUpState extends Equatable {
  const SignUpState({
    this.email = '',
    this.firstName = '',
    this.lastName = '',
    this.password = '',
    this.confirmPassword = '',
    this.emailError = '',
    this.passwordError = '',
  });

  final String email;
  final String firstName;
  final String lastName;
  final String password;
  final String confirmPassword;
  final String emailError;
  final String passwordError;

  @override
  List<Object> get props => [
        email,
        firstName,
        lastName,
        password,
        confirmPassword,
        emailError,
        passwordError,
      ];

  SignUpState copyWith({
    String? email,
    String? firstName,
    String? lastName,
    String? password,
    String? confirmPassword,
    String? emailError,
    String? passwordError,
  }) {
    return SignUpState(
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      emailError: emailError ?? this.emailError,
      passwordError: passwordError ?? this.passwordError,
    );
  }
}*/

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
  });

  final String emailError;
  final String firstNameError;
  final String lastNameError;
  final String passwordError;

  @override
  List<Object> get props => [
        emailError,
        firstNameError,
        lastNameError,
        passwordError,
      ];
}

class SignUpEmailErrorCleared extends SignUpState {}

class SignUpFirstNameErrorCleared extends SignUpState {}

class SignUpLastNameErrorCleared extends SignUpState {}

class SignUpPasswordErrorCleared extends SignUpState {}

class SignUpLoading extends SignUpState {}

class SignUpSubmissionSuccess extends SignUpState {}

class SignUpSubmissionFailure extends SignUpState {}
