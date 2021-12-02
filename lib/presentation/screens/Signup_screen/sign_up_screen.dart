import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:simple_social_media/business_logic/bloc/image_bloc/image_bloc.dart';
import 'package:simple_social_media/data/repositories/pin_repository.dart';
import 'package:simple_social_media/presentation/screens/widgets/pick_avatar_image.dart';
import '../../../business_logic/bloc/sign_up_bloc/sign_up_bloc.dart';
import '../../router/app_router.dart';
import '../landing_screen/landing_screen.dart';
import '../widgets/button_to_screen.dart';
import '../widgets/description_text.dart';
import '../widgets/rounded_button.dart';
import '../widgets/text_field_custom.dart';
import '../widgets/title_text.dart';

class SignUpScreen extends StatelessWidget {
  final _emailController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  File? userProfileImage;
  SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final phoneSize = MediaQuery.of(context).size;
    final signUpBloc = BlocProvider.of<SignUpBloc>(context);
    return Scaffold(
      body: SafeArea(
        child: MultiBlocListener(
          listeners: [
            BlocListener<SignUpBloc, SignUpState>(
              listener: (context, state) {
                if (state is SignUpSubmissionSuccess) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => LandingScreen(),
                    ),
                  );
                } else if (state is SignUpValidationError &&
                    state.imageError != '') {
                  Fluttertoast.cancel();
                  Fluttertoast.showToast(msg: state.imageError);
                }
              },
            ),
            BlocListener<ImageBloc, ImageState>(
              listener: (context, state) {
                if (state is ImageSuccess) {
                  userProfileImage = state.image;
                }
              },
            ),
          ],
          child: Container(
            height: double.infinity,
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: phoneSize.width * 0.1),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 50),
                  const TitleText(
                    text: 'Sign up',
                    fontWeight: FontWeight.bold,
                    textColor: Colors.black,
                    textSize: 30,
                  ),
                  const SizedBox(height: 25),
                  BlocBuilder<ImageBloc, ImageState>(
                    builder: (context, state) {
                      return Align(
                        alignment: Alignment.center,
                        child: state is ImageSuccess
                            ? PickAvatarImage(
                                radius: 75,
                                avatarImageFile: state.image,
                              )
                            : PickAvatarImage(radius: 75),
                      );
                    },
                  ),
                  const SizedBox(height: 25),
                  BlocBuilder<SignUpBloc, SignUpState>(
                    builder: (context, state) {
                      return TextFieldCustom(
                        controller: _emailController,
                        fieldLength: double.infinity,
                        label: 'Email',
                        isCapitalized: false,
                        errorText: emailError(state),
                      );
                    },
                  ),
                  const SizedBox(height: 25),
                  _buildNameFields(
                    _firstNameController,
                    _lastNameController,
                    phoneSize,
                  ),
                  const SizedBox(height: 25),
                  BlocBuilder<SignUpBloc, SignUpState>(
                    builder: (context, state) {
                      return TextFieldCustom(
                        controller: _passwordController,
                        fieldLength: double.infinity,
                        label: 'Password',
                        isCapitalized: false,
                        isObscured: true,
                        errorText: passwordError(state),
                      );
                    },
                  ),
                  const SizedBox(height: 25),
                  TextFieldCustom(
                    controller: _confirmPasswordController,
                    fieldLength: double.infinity,
                    label: 'Confirm Password',
                    isCapitalized: false,
                    isObscured: true,
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
                  BlocBuilder<SignUpBloc, SignUpState>(
                    builder: (context, state) {
                      if (state is SignUpLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return RoundedButton(
                        height: phoneSize.height * 0.075,
                        buttonText: 'Sign up',
                        isEnabled: true,
                        callback: () {
                          signUpBloc.add(
                            SignUpSubmitted(
                              email: _emailController.text,
                              firstName: _firstNameController.text,
                              lastName: _lastNameController.text,
                              password: _passwordController.text,
                              confirmPassword: _confirmPasswordController.text,
                              userProfileImage: userProfileImage,
                            ),
                          );
                        },
                      );
                    },
                  ),
                  const ButtonToScreen(
                    toRoute: RouteConstants.logInSreen,
                    description: 'Already have an account?',
                    buttonText: 'Log in',
                  ),
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
        BlocBuilder<SignUpBloc, SignUpState>(
          builder: (context, state) {
            print(state);
            return TextFieldCustom(
              controller: _firstNameController,
              fieldLength: phoneSize.width * 0.35,
              label: 'First Name',
              errorText: firstNameError(state),
            );
          },
        ),
        const Expanded(
          child: SizedBox(),
        ),
        BlocBuilder<SignUpBloc, SignUpState>(
          builder: (context, state) {
            return TextFieldCustom(
              controller: _lastNameController,
              fieldLength: phoneSize.width * 0.35,
              label: 'Last Name',
              errorText: lastNameError(state),
            );
          },
        ),
      ],
    );
  }

  String? emailError(SignUpState state) {
    if (state is SignUpValidationError && state.emailError != '') {
      return state.emailError;
    }
    return null;
  }

  String? firstNameError(SignUpState state) {
    if (state is SignUpValidationError && state.firstNameError != '') {
      return state.firstNameError;
    }
    return null;
  }

  String? lastNameError(SignUpState state) {
    if (state is SignUpValidationError && state.lastNameError != '') {
      return state.lastNameError;
    }
    return null;
  }

  String? passwordError(SignUpState state) {
    if (state is SignUpValidationError && state.passwordError != '') {
      return state.passwordError;
    }
    return null;
  }
}
