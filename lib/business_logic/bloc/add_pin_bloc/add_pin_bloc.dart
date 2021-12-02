import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:simple_social_media/core/validators/is_image_null_mixin.dart';
import 'package:simple_social_media/core/validators/passed_parameters_validator_mixin.dart';
import 'package:simple_social_media/core/validators/string_nonempty_validator_mixin.dart';
import 'package:simple_social_media/data/repositories/pin_repository.dart';

part 'add_pin_event.dart';
part 'add_pin_state.dart';

class AddPinBloc extends Bloc<AddPinEvent, AddPinState>
    with
        PassedParametersValidatorMixin,
        StringNonemptyValidatorMixin,
        IsImageNullMixin {
  AddPinBloc({required this.pinRepository}) : super(AddPinInitial()) {
    on<AddPinSubmitted>(_onAddPinSubmitted);
  }
  final PinRepository pinRepository;

  _onAddPinSubmitted(
    AddPinSubmitted event,
    Emitter<AddPinState> emit,
  ) async {
    bool areFieldsValid = true;
    emit(AddPinLoading());
    areFieldsValid = areParametrsValid([
      isStringNotEmpty(event.pinName),
      isStringNotEmpty(event.pinDescription),
      isImageNull(event.pinImageFile),
    ]);
    if (!areFieldsValid) {
      emit(
        AddPinValidationError(
          pinNameError: isStringNotEmpty(event.pinName),
          pinDescriptionError: isStringNotEmpty(event.pinDescription),
          pinImageError: isImageNull(event.pinImageFile),
        ),
      );
      return;
    }
    try {
      await pinRepository.uploadPin(
        pinImageFile: event.pinImageFile,
        pinName: event.pinName,
        pinDescription: event.pinDescription,
      );
      emit(AddPinSuccess());
    } catch (error) {
      emit(AddPinFailure());
    }
  }
}
