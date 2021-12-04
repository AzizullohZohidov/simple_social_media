import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:simple_social_media/data/models/pin_model.dart';
import 'package:simple_social_media/data/repositories/pin_repository.dart';

part 'feed_event.dart';
part 'feed_state.dart';

class FeedBloc extends Bloc<FeedEvent, FeedState> {
  FeedBloc({required this.pinRepository}) : super(FeedInitial()) {
    on<FeedInitializationRequested>(_onFeedInitializationRequested);
  }
  final PinRepository pinRepository;

  void _onFeedInitializationRequested(
    FeedInitializationRequested event,
    Emitter<FeedState> emit,
  ) async {
    try {
      var allPins = await pinRepository.fetchAllPins();
      emit(FeedInitialization(allPins: allPins));
    } catch (error) {
      emit(FeedInitialization(allPins: []));
    }
  }
}
