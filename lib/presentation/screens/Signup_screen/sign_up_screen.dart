import 'package:flutter/material.dart';
import 'package:simple_social_media/presentation/screens/widgets/description_text.dart';
import '../widgets/rounded_button.dart';
import '../widgets/text_field_custom.dart';
import '../widgets/title_text.dart';

class SignUpScreen extends StatelessWidget {
  final _emailController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _passwordController = TextEditingController();
  SignUpScreen({Key? key}) : super(key: key);

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
                    text: 'Sign up',
                    isBold: true,
                    textColor: Colors.black,
                    textSize: 30,
                  ),
                  const SizedBox(height: 50),
                  TextFieldCustom(
                    controller: _emailController,
                    fieldLength: double.infinity,
                    label: 'Email',
                  ),
                  const SizedBox(height: 25),
                  _buildNameFields(
                      _firstNameController, _lastNameController, phoneSize),
                  const SizedBox(height: 25),
                  TextFieldCustom(
                    controller: _passwordController,
                    fieldLength: double.infinity,
                    label: 'Password',
                  ),
                  const SizedBox(height: 25),
                  DescriptionText(
                    text:
                        'By signing up you agree to our Terms of Use and Privacy Policy',
                    isBold: false,
                    textColor: Colors.grey,
                    textSize: 14,
                    fieldWidth: phoneSize.width * 0.8,
                  ),
                  const SizedBox(height: 25),
                  RoundedButton(
                    height: phoneSize.height * 0.075,
                    buttonText: 'Sign up',
                    isEnabled: true,
                    callback: () {},
                  ),
                  const Expanded(child: SizedBox()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Already have an account?',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(width: 15),
                      Text(
                        'Log in',
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

  Widget _buildNameFields(
    TextEditingController _firstNameController,
    TextEditingController _lastNameController,
    final Size phoneSize,
  ) {
    return Row(
      children: [
        TextFieldCustom(
          controller: _firstNameController,
          fieldLength: phoneSize.width * 0.35,
          label: 'First Name',
        ),
        const Expanded(
          child: SizedBox(),
        ),
        TextFieldCustom(
          controller: _lastNameController,
          fieldLength: phoneSize.width * 0.35,
          label: 'Last Name',
        ),
      ],
    );
  }
}
