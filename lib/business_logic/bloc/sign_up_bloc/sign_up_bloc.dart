import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitial()) {
    on<SignUpEmailChanged>(_onEmailChanged);
    on<SignUpFirstNameChanged>(_onFirstNameChanged);
    on<SignUpLastNameChanged>(_onLastChanged);
    on<SignUpPasswordChanged>(_onPasswordChanged);
    on<SignUpConfirmPasswordChanged>(_onConfirmPasswordChanged);
    on<SignUpSubmitted>(_onSignUpSubmitted);
  }

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
  ) {
    emit(SignUpLoading());
    print('Simulation of authentication process has begun');
    emit(SignUpSubmissionSuccess());
    print('Success state is emitted');
  }
}
