import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:simple_social_media/business_logic/bloc/log_in_bloc/log_in_bloc.dart';
import '../../router/app_router.dart';
import '../widgets/button_to_screen.dart';
import '../widgets/rounded_button.dart';
import '../widgets/text_field_custom.dart';
import '../widgets/title_text.dart';

class LogInScreen extends StatelessWidget {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  late LogInBloc logInBloc;
  LogInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final phoneSize = MediaQuery.of(context).size;
    logInBloc = BlocProvider.of<LogInBloc>(context);
    return Scaffold(
      body: BlocListener<LogInBloc, LogInState>(
        listener: (context, state) {
          if (state is LogInSubmissionFailure) {
            Fluttertoast.cancel();
            Fluttertoast.showToast(msg: 'Wrong email or password!');
          } else if (state is LogInSubmissionSuccess) {
            Navigator.of(context).pushNamed(RouteConstants.landingScreen);
          }
        },
        child: SafeArea(
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
                    const SizedBox(height: 50),
                    const TitleText(
                      text: 'Log in',
                      fontWeight: FontWeight.bold,
                      textColor: Colors.black,
                      textSize: 30,
                    ),
                    const SizedBox(height: 50),
                    BlocBuilder<LogInBloc, LogInState>(
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
                    BlocBuilder<LogInBloc, LogInState>(
                      builder: (context, state) {
                        return TextFieldCustom(
                          controller: _passwordController,
                          fieldLength: double.infinity,
                          label: 'Password',
                          isObscured: true,
                          errorText: passwordError(state),
                        );
                      },
                    ),
                    const SizedBox(height: 50),
                    BlocBuilder<LogInBloc, LogInState>(
                      builder: (context, state) {
                        if (state is LogInLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        return RoundedButton(
                          height: phoneSize.height * 0.075,
                          buttonText: 'Log in',
                          isEnabled: true,
                          callback: () {
                            logInBloc.add(
                              LogInSubmitted(
                                  email: _emailController.text,
                                  password: _passwordController.text),
                            );
                          },
                        );
                      },
                    ),
                    const Expanded(child: SizedBox()),
                    const ButtonToScreen(
                      toRoute: RouteConstants.signUpScreen,
                      description: 'Do not have an account?',
                      buttonText: 'Sign up',
                    ),
                    const SizedBox(height: 50),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  String? emailError(LogInState state) {
    if (state is LogInValidationError && state.emailError != '') {
      return state.emailError;
    }
    return null;
  }

  String? passwordError(LogInState state) {
    if (state is LogInValidationError && state.passwordError != '') {
      return state.passwordError;
    }
    return null;
  }
}
