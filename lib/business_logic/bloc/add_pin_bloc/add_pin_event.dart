part of 'add_pin_bloc.dart';

abstract class AddPinEvent extends Equatable {
  const AddPinEvent();

  @override
  List<Object> get props => [];
}

class AddPinSubmitted extends AddPinEvent {
  final File pinImageFile;
  final String pinName;
  final String pinDescription;

  const AddPinSubmitted({
    required this.pinImageFile,
    required this.pinName,
    required this.pinDescription,
  });

  @override
  List<Object> get props => [pinImageFile, pinName, pinDescription];
}
