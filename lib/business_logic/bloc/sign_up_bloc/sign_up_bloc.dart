import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:simple_social_media/core/validators/is_image_null_mixin.dart';
import '../../../core/validators/confirm_password_validator_mixin.dart';
import '../../../core/validators/email_validator_mixin.dart';
import '../../../core/validators/passed_parameters_validator_mixin.dart';
import '../../../core/validators/password_validator_mixin.dart';
import '../../../core/validators/string_nonempty_validator_mixin.dart';
import '../../../data/repositories/authentication_repository.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState>
    with
        EmailValidatorMixin,
        PasswordValidatorMixin,
        ConfirmPasswordValidatorMixin,
        StringNonemptyValidatorMixin,
        PassedParametersValidatorMixin,
        IsImageNullMixin {
  SignUpBloc({required this.authRepo}) : super(SignUpInitial()) {
    on<SignUpEmailChanged>(_onEmailChanged);
    on<SignUpFirstNameChanged>(_onFirstNameChanged);
    on<SignUpLastNameChanged>(_onLastChanged);
    on<SignUpPasswordChanged>(_onPasswordChanged);
    on<SignUpConfirmPasswordChanged>(_onConfirmPasswordChanged);
    on<SignUpSubmitted>(_onSignUpSubmitted);
  }

  final AuthenticationRepository authRepo;

  void _onEmailChanged(
    SignUpEmailChanged event,
    Emitter<SignUpState> emit,
  ) {
    emit(SignUpEmailErrorCleared());
  }

  void _onFirstNameChanged(
    SignUpFirstNameChanged event,
    Emitter<SignUpState> emit,
  ) {
    emit(SignUpFirstNameErrorCleared());
  }

  void _onLastChanged(
    SignUpLastNameChanged event,
    Emitter<SignUpState> emit,
  ) {
    emit(SignUpLastNameErrorCleared());
  }

  void _onPasswordChanged(
    SignUpPasswordChanged event,
    Emitter<SignUpState> emit,
  ) {
    emit(SignUpPasswordErrorCleared());
  }

  void _onConfirmPasswordChanged(
    SignUpConfirmPasswordChanged event,
    Emitter<SignUpState> emit,
  ) {
    emit(SignUpPasswordErrorCleared());
  }

  void _onSignUpSubmitted(
    SignUpSubmitted event,
    Emitter<SignUpState> emit,
  ) async {
    bool areFieldsValid;
    emit(SignUpLoading());
    print('Simulation of authentication process has begun');
    areFieldsValid = areParametrsValid([
      validateEmail(event.email),
      validatePassword(event.password),
      isStringNotEmpty(event.firstName),
      isStringNotEmpty(event.lastName),
      checkPasswordMatch(event.password, event.confirmPassword),
      isImageNull(event.userProfileImage),
    ]);
    if (!areFieldsValid) {
      emit(
        SignUpValidationError(
          emailError: validateEmail(event.email),
          firstNameError: isStringNotEmpty(event.firstName),
          lastNameError: isStringNotEmpty(event.lastName),
          passwordError: validatePassword(event.password) != ''
              ? validatePassword(event.password)
              : checkPasswordMatch(event.password, event.confirmPassword),
          imageError: isImageNull(event.userProfileImage),
        ),
      );
      return;
    }
    //Since no validation error occured we proceed to signing up the user
    try {
      await authRepo.signUpAndSaveInDB(
        email: event.email,
        firstName: event.firstName,
        lastName: event.lastName,
        password: event.password,
        imageFile: event.userProfileImage!,
      );
      emit(SignUpSubmissionSuccess());
    } catch (error) {
      emit(SignUpSubmissionFailure());
    }
  }
}
