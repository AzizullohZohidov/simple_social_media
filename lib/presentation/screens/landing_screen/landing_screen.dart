import 'package:flutter/material.dart';
import '../../router/app_router.dart';
import '../feed_screen/feed_screen.dart';
import '../profile_screen/profile_screen.dart';

class LandingScreen extends StatefulWidget {
  LandingScreen({Key? key}) : super(key: key);

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  var pageIndex = 0;
  final screens = [
    FeedScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _buildBottomNavigationBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _buildFloatingActionButton(),
      body: screens[pageIndex],
    );
  }

  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: pageIndex,
      onTap: (index) => setState(() {
        pageIndex = index;
      }),
      backgroundColor: Colors.white,
      selectedItemColor: Colors.deepOrange,
      unselectedItemColor: Colors.grey,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    );
  }

  Widget _buildFloatingActionButton() {
    return ElevatedButton(
      onPressed: () =>
          Navigator.of(context).pushNamed(RouteConstants.addPinScreen),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(18),
        shape: const CircleBorder(),
        primary: Colors.deepOrange,
        elevation: 3,
      ),
      child: const Icon(Icons.add),
    );
  }
}
