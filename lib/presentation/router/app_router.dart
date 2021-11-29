import 'package:flutter/material.dart';
import 'package:simple_social_media/presentation/screens/Login_screen/log_in_screen.dart';
import 'package:simple_social_media/presentation/screens/Signup_screen/sign_up_screen.dart';
import 'package:simple_social_media/presentation/screens/landing_screen/landing_screen.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RouteConstants.signUp:
        return MaterialPageRoute(builder: (_) => SignUpScreen());
        break;
      case RouteConstants.logIn:
        return MaterialPageRoute(builder: (_) => LogInScreen());
        break;
      case RouteConstants.landingPage:
        return MaterialPageRoute(builder: (_) => LandingScreen());
        break;
      default:
        return MaterialPageRoute(builder: (_) => SignUpScreen());
    }
  }
}

class RouteConstants {
  static const signUp = '/sign-up';
  static const logIn = '/log-in';
  static const landingPage = '/landing-page';
}
