import 'package:flutter/material.dart';
import 'package:simple_social_media/presentation/screens/Login_screen/log_in_screen.dart';
import 'package:simple_social_media/presentation/screens/Signup_screen/sign_up_screen.dart';
import 'package:simple_social_media/presentation/screens/add_pin_screen/add_pin_screen.dart';
import 'package:simple_social_media/presentation/screens/feed_screen/feed_screen.dart';
import 'package:simple_social_media/presentation/screens/landing_screen/landing_screen.dart';
import 'package:simple_social_media/presentation/screens/profile_screen/profile_screen.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RouteConstants.signUpScreen:
        return MaterialPageRoute(builder: (_) => SignUpScreen());
        break;
      case RouteConstants.logInSreen:
        return MaterialPageRoute(builder: (_) => LogInScreen());
        break;
      case RouteConstants.landingScreen:
        return MaterialPageRoute(builder: (_) => LandingScreen());
        break;
      case RouteConstants.feedScreen:
        return MaterialPageRoute(builder: (_) => FeedScreen());
        break;
      case RouteConstants.profileScreen:
        return MaterialPageRoute(builder: (_) => ProfileScreen());
        break;
      case RouteConstants.addPinScreen:
        return MaterialPageRoute(builder: (_) => AddPinScreen());
        break;
      default:
        return MaterialPageRoute(builder: (_) => LogInScreen());
    }
  }
}

class RouteConstants {
  static const signUpScreen = '/sign-up-screen';
  static const logInSreen = '/log-in-screen';
  static const landingScreen = '/landing-screen';
  static const feedScreen = '/feed-screen';
  static const profileScreen = '/profile-screen';
  static const addPinScreen = '/add-pin-screen';
}
