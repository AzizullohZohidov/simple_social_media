import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../core/validators/email_validator_mixin.dart';
import '../../../core/validators/passed_parameters_validator_mixin.dart';
import '../../../core/validators/password_validator_mixin.dart';
import '../../../data/repositories/authentication_repository.dart';

part 'log_in_event.dart';
part 'log_in_state.dart';

class LogInBloc extends Bloc<LogInEvent, LogInState>
    with
        EmailValidatorMixin,
        PasswordValidatorMixin,
        PassedParametersValidatorMixin {
  LogInBloc({required this.authRepo}) : super(LogInInitial()) {
    on<LogInEvent>((event, emit) {
      on<LogInSubmitted>(_onLogInSubmitted);
    });
  }

  final AuthenticationRepository authRepo;

  void _onLogInSubmitted(
    LogInSubmitted event,
    Emitter<LogInState> emit,
  ) async {
    bool areFieldsValid;
    emit(LogInLoading());
    areFieldsValid = areParametrsValid([
      validateEmail(event.email),
      validatePassword(event.password),
    ]);
    if (!areFieldsValid) {
      emit(
        LogInValidationError(
          emailError: validateEmail(event.email),
          passwordError: validatePassword(event.password),
        ),
      );
      return;
    }
    //Since no validation error occured we proceed to signing up the user
    try {
      await authRepo.logIn(
        email: event.email,
        password: event.password,
      );
      emit(LogInSubmissionSuccess());
    } catch (error) {
      emit(LogInSubmissionFailure());
    }
  }
}
