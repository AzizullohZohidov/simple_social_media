import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_social_media/business_logic/bloc/feed_bloc/feed_bloc.dart';
import 'package:simple_social_media/business_logic/bloc/image_bloc/image_bloc.dart';
import 'package:simple_social_media/business_logic/bloc/log_in_bloc/log_in_bloc.dart';
import 'package:simple_social_media/data/repositories/image_repository.dart';
import 'package:simple_social_media/data/repositories/pin_repository.dart';
import 'business_logic/bloc/profile_bloc/profile_bloc.dart';
import 'business_logic/bloc/sign_up_bloc/sign_up_bloc.dart';
import 'data/repositories/authentication_repository.dart';
import 'data/repositories/user_repository.dart';
import 'presentation/router/app_router.dart';
import 'presentation/screens/Login_screen/log_in_screen.dart';
import 'presentation/screens/Signup_screen/sign_up_screen.dart';
import 'presentation/screens/landing_screen/landing_screen.dart';
import 'presentation/screens/post_details_screen/post_details_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const MaterialApp(
            home: Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        }
        return MultiBlocProvider(
          providers: [
            BlocProvider<SignUpBloc>(
              create: (context) =>
                  SignUpBloc(authRepo: AuthenticationRepository()),
            ),
            BlocProvider<LogInBloc>(
              create: (context) =>
                  LogInBloc(authRepo: AuthenticationRepository()),
            ),
            BlocProvider<ProfileBloc>(
              create: (context) => ProfileBloc(
                userRepository: UserRepository(
                  pinRepository: PinRepository(),
                ),
              ),
            ),
            BlocProvider<FeedBloc>(
              create: (context) => FeedBloc(
                pinRepository: PinRepository(),
              ),
            ),
            BlocProvider<ImageBloc>(
              create: (context) =>
                  ImageBloc(imageRepository: ImageRepository()),
            ),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            scrollBehavior: const ScrollBehavior().copyWith(overscroll: false),
            title: 'Simple Social Media App',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            //home: LandingScreen(),
            home: SignUpScreen(),
            /*home: PostDetailsScreen(
              imageUrl:
                  'https://cdn.pixabay.com/photo/2020/06/28/04/07/cat-5347790_1280.jpg',
              title: 'Interesting looking cat!',
              description:
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. ',
            ),*/
            onGenerateRoute: AppRouter.onGenerateRoute,
          ),
        );
      },
    );
  }
}
