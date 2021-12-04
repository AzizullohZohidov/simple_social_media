import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_social_media/presentation/screens/widgets/images_grid.dart';
import 'package:simple_social_media/presentation/screens/widgets/title_text.dart';
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
      body: BlocBuilder<ProfileBloc, ProfileState>(
        buildWhen: (prev, curr) {
          if (prev != curr) {
            return true;
          } else if (curr is ProfileInitialization) {
            return true;
          }
          return false;
        },
        builder: (context, state) {
          print(state);
          return Center(
            child: state is ProfileInitialization
                ? _buildMyImagesGrid(state)
                : const CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Widget _buildProfileImage(ProfileInitialization state) {
    return AvatarPicture(
      avatarImagePath: state.currentUser.userProfileImageUrl,
      radius: widget.phoneSize.width * 0.18,
      outlineWidth: 3,
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
        'Software Developer',
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
    if (state.currentUser.userPins.isEmpty) {
      return Column(
        children: [
          _buildProfileBar(state, 24, 24, 24),
          const Expanded(
            child: Center(
              child: Text('Hey it seems you have not uploaded photos yet!'),
            ),
          ),
        ],
      );
    }
    return ImagesGrid(
      pins: state.currentUser.userPins,
      tileCornerRadius: 15,
      needPrefixWidget: true,
      prefixWidget: _buildProfileBar(state),
    );
  }

  Widget _buildProfileBar(
    ProfileInitialization state, [
    double topPadding = 0,
    double leftPadding = 0,
    double rightPadding = 0,
  ]) {
    return Transform.scale(
      scale: 1.14,
      child: Padding(
        padding: EdgeInsets.only(
          top: topPadding,
          right: rightPadding,
          left: leftPadding,
        ),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 325,
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
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              alignment: Alignment.centerLeft,
              child: const TitleText(
                text: 'My Posts',
                fontWeight: FontWeight.bold,
                textColor: Colors.deepOrange,
                textSize: 21,
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
