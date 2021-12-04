import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../business_logic/bloc/profile_bloc/profile_bloc.dart';
import '../widgets/avatar_picture.dart';

class ProfileScreen extends StatefulWidget {
  late ProfileBloc profileBloc;
  late Size phoneSize;
  ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    widget.profileBloc = BlocProvider.of<ProfileBloc>(context);
    widget.profileBloc.add(ProfileInitializationRequested());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    widget.phoneSize = MediaQuery.of(context).size;
    return Scaffold(
      //appBar: _buildAppBar(),
      body: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          print(state);
          return Center(
            child: state is ProfileInitialization
                ? Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 350,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.redAccent.shade200,
                              Colors.orange.shade300,
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child: SafeArea(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _buildProfileImage(state),
                              _buildName(state),
                              _buildProfession(),
                              _buildEmail(state),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                : const CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      centerTitle: true,
      title: const Text(
        'Profile',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.deepOrange,
        ),
      ),
      backgroundColor: Colors.white10,
      systemOverlayStyle:
          SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.white10),
      elevation: 0,
    );
  }

  Widget _buildProfileImage(ProfileInitialization state) {
    return AvatarPicture(
      avatarImagePath: state.currentUser.userProfileImageUrl,
      radius: widget.phoneSize.width * 0.2,
    );
  }

  Widget _buildName(ProfileInitialization state) {
    return Padding(
      padding: const EdgeInsets.only(top: 14.0),
      child: Text(
        state.currentUser.firstName + ' ' + state.currentUser.lastName,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildProfession() {
    return const Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Text(
        'Photographer',
        style: TextStyle(
          fontSize: 16,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildEmail(ProfileInitialization state) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.email_outlined,
            color: Colors.white,
          ),
          const SizedBox(width: 10),
          Text(
            state.currentUser.email,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMyImagesGrid(ProfileInitialization state) {
    if (state.currentUser.pinImageIds == []) {
      return const Center(
        child: Text('Hey it seems you have not uploaded photos yet!'),
      );
    }
    return const Text('Here grid should be returned');
  }
}
