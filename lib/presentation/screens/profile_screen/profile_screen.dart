import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      ),
      body: const Center(
        child: Text('Here should be profile page!'),
      ),
    );
  }
}
