import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../data/models/user_model.dart';
import '../../../data/repositories/user_repository.dart';

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
      print('Emiting from try block');
      //For debugging purposes only
      //print(currentUser);
    } catch (error) {
      print('Emiting from catch block');
      emit(ProfileInitialization(currentUser: UserModel.empty()));
    }
  }
}
