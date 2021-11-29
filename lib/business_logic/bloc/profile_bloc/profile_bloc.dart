import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:simple_social_media/data/models/user_model.dart';
import 'package:simple_social_media/data/repositories/user_repository.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final UserRepository userRepository;
  ProfileBloc({required this.userRepository}) : super(const ProfileInitial()) {
    on<ProfileInitializationRequested>(_onProfileInitializationRequested);
  }

  void _onProfileInitializationRequested(
    ProfileInitializationRequested event,
    Emitter<ProfileState> emit,
  ) async {
    try {
      UserModel? currentUser = await userRepository.getCurrentUser();
      emit(ProfileInitialization(currentUser: currentUser!));
      //For debugging purposes only
      //print(currentUser);
    } catch (error) {
      emit(ProfileInitialization(currentUser: UserModel.empty()));
    }
  }
}
