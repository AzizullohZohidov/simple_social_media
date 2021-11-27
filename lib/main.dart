import 'package:flutter/material.dart';
import 'package:simple_social_media/presentation/screens/Login_screen/log_in_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Simple Social Media App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LogInScreen(),
    );
  }
}
