part of 'feed_bloc.dart';

abstract class FeedState extends Equatable {
  const FeedState();

  @override
  List<Object> get props => [];
}

class FeedInitial extends FeedState {}

class FeedInitialization extends FeedState {
  const FeedInitialization({required this.allPins});

  final List<PinModel> allPins;

  @override
  List<Object> get props => [allPins];
}
