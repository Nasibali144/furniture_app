import 'package:flutter/material.dart';
import 'package:furniture_app/screens/home_screen.dart';
import 'package:furniture_app/screens/sign_up_screen.dart';
import 'package:furniture_app/services/constants/colors.dart';
import 'package:furniture_app/services/constants/strings.dart';
import 'package:furniture_app/services/constants/svg_icons.dart';
import 'package:furniture_app/services/theme/text_styles.dart';
import 'package:furniture_app/views/custom_text_field.dart';
import 'package:furniture_app/views/login_button.dart';

class SignInScreen extends StatefulWidget {
  static const id = "/signIn";

  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          top: false,
          minimum: const EdgeInsets.only(right: 30, bottom: 50),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Logo
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 40, bottom: 30, left: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 1,
                          width: width / 3.5,
                          color: AppColors.cBDBDBD.color,
                        ),
                        SvgIcon.logo,
                        Container(
                          height: 1,
                          width: width / 3.5,
                          color: AppColors.cBDBDBD.color,
                        ),
                      ],
                    ),
                  ),
                  // Text: Hello
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Text(
                        Strings.hello.text,
                        style: AppTextStyles.merriWeatherRegular30.copyWith(
                          color: AppColors.c909090.color,
                        ),
                      ),
                    ),
                  ),
                  // Text: Welcome Back
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 27, left: 30),
                      child: Text(
                        Strings.welcomeBack.text,
                        style: AppTextStyles.merriWeatherBold24.copyWith(
                          color: AppColors.c303030.color,
                          letterSpacing: 1.5,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  Container(
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      color: AppColors.cFFFFFF.color,
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 0),
                          blurRadius: 10,
                          color: Colors.grey.shade300,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Column(
                        children: [
                          // Input: Email
                          const SizedBox(height: 35),
                          Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: CustomTextField(
                              labelText: Strings.email.text,
                              isObscure: false,
                            ),
                          ),

                          // Input: Email
                          const SizedBox(height: 35),
                          Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: CustomTextField(
                              labelText: Strings.password.text,
                              isObscure: true,
                            ),
                          ),

                          // Text: Forgot Password
                          const SizedBox(height: 35),
                          Text(
                            Strings.forgotPassword.text,
                            style: AppTextStyles.nunitoSansSemiBold18,
                          ),

                          // Button: Sign in
                          const SizedBox(height: 40),
                          LoginButton(
                            onPressed: () {
                              Navigator.of(context).pushReplacementNamed(HomeScreen.id);
                            },
                            text: Strings.signIn.text,
                          ),

                          // Text: Sign up
                          const SizedBox(height: 30),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context)
                                  .pushReplacementNamed(SignUpScreen.id);
                            },
                            child: Text(
                              Strings.signUp.text,
                              style: AppTextStyles.nunitoSansSemiBold18,
                            ),
                          ),
                          const SizedBox(height: 40),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
