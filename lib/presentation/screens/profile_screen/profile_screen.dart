import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_social_media/business_logic/bloc/profile_bloc/profile_bloc.dart';

class ProfileScreen extends StatefulWidget {
  late ProfileBloc profileBloc;
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
    return Scaffold(
      appBar: _buildAppBar(),
      body: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          print(state);
          return Center(
            child: state is ProfileInitialization
                ? Column(
                    children: [
                      Text('Your id: ${state.currentUser.id}'),
                      Text('Your email: ${state.currentUser.email}'),
                      Text('Your firstName: ${state.currentUser.firstName}'),
                      Text('Your lastName: ${state.currentUser.lastName}'),
                      Text('Your createdAt: ${state.currentUser.createdAt}'),
                    ],
                  )
                : Text('Hmm data seems to be missing'),
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
}
