import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_social_media/business_logic/bloc/sign_up_bloc/sign_up_bloc.dart';
import 'package:simple_social_media/data/repositories/authentication_repository.dart';
import 'package:simple_social_media/presentation/screens/Login_screen/log_in_screen.dart';
import 'package:simple_social_media/presentation/screens/Signup_screen/sign_up_screen.dart';

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
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Simple Social Media App',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: BlocProvider(
            create: (context) => SignUpBloc(AuthenticationRepository()),
            child: SignUpScreen(),
          ),
          //home: LogInScreen(),
        );
      },
    );
  }
}
