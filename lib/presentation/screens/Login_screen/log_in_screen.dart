import 'package:flutter/material.dart';
import '../widgets/rounded_button.dart';
import '../widgets/text_field_custom.dart';
import '../widgets/title_text.dart';

class LogInScreen extends StatelessWidget {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  LogInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final phoneSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: phoneSize.width * 0.1),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: SizedBox(
              height: phoneSize.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 75),
                  const TitleText(
                    text: 'Log in',
                    isBold: true,
                    textColor: Colors.black,
                    textSize: 30,
                  ),
                  const SizedBox(height: 50),
                  TextFieldCustom(
                    controller: _emailController,
                    fieldLength: double.infinity,
                    label: 'Email',
                    isCapitalized: false,
                  ),
                  const SizedBox(height: 25),
                  TextFieldCustom(
                    controller: _passwordController,
                    fieldLength: double.infinity,
                    label: 'Password',
                    isObscured: true,
                  ),
                  const SizedBox(height: 50),
                  RoundedButton(
                    height: phoneSize.height * 0.075,
                    buttonText: 'Log in',
                    isEnabled: true,
                    callback: () {},
                  ),
                  const Expanded(child: SizedBox()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Do not have an account?',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(width: 15),
                      Text(
                        'Sign up',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
