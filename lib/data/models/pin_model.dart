import 'package:equatable/equatable.dart';

class PinModel extends Equatable {
  final String userId;
  final String pinDocId;
  final String pinImageUrl;
  final String pinName;
  final String pinDescription;
  final String createdAt;

  PinModel({
    required this.userId,
    required this.pinDocId,
    required this.pinImageUrl,
    required this.pinName,
    required this.pinDescription,
    required this.createdAt,
  });

  PinModel.empty({
    this.userId = '',
    this.pinDocId = '',
    this.pinImageUrl = '',
    this.pinName = '',
    this.pinDescription = '',
    this.createdAt = '',
  });

  @override
  List<Object?> get props => [
        userId,
        pinDocId,
        pinImageUrl,
        pinName,
        pinDescription,
        createdAt,
      ];
}
