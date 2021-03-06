import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_social_media/business_logic/bloc/add_pin_bloc/add_pin_bloc.dart';
import 'package:simple_social_media/business_logic/bloc/image_bloc/image_bloc.dart';
import 'package:simple_social_media/data/repositories/image_repository.dart';
import 'package:simple_social_media/data/repositories/pin_repository.dart';
import '../screens/Login_screen/log_in_screen.dart';
import '../screens/Signup_screen/sign_up_screen.dart';
import '../screens/add_pin_screen/add_pin_screen.dart';
import '../screens/feed_screen/feed_screen.dart';
import '../screens/landing_screen/landing_screen.dart';
import '../screens/profile_screen/profile_screen.dart';

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
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => ImageBloc(
                  imageRepository: ImageRepository(),
                ),
              ),
              BlocProvider(
                create: (context) => AddPinBloc(
                  pinRepository: PinRepository(),
                ),
              ),
            ],
            child: AddPinScreen(),
          ),
        );
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
