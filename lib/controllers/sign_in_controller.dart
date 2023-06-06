import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app/controllers/base_controller.dart';
import 'package:furniture_app/screens/home_screen.dart';
import 'package:furniture_app/screens/sign_up_screen.dart';
import 'package:furniture_app/services/constants/colors.dart';
import 'package:furniture_app/services/data/database/users.dart';

class SignInController extends BaseController {
  TextEditingController emailController;
  TextEditingController passwordController;
  void Function(void Function())? updater;
  bool isLoading = false;

  SignInController({this.updater})
      : emailController = TextEditingController(),
        passwordController = TextEditingController();

  @override
  void close() {
    emailController.dispose();
    passwordController.dispose();
    super.close();
  }

  void signIn(BuildContext context) async {
    isLoading = true;
    updater!(() {});

    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    debugPrint(email);
    debugPrint(password);

    /// user exist:
    // validation
    for (int i = 0; i < usersList.length; i++) {
      if (usersList[i].email == email && usersList[i].password == password) {
        await Future.delayed(const Duration(seconds: 2));
        isLoading = false;
        updater!(() {});
        Navigator.of(context).pushReplacementNamed(HomeScreen.id);
        return;
      }
    }
    isLoading = false;
    updater!(() {});
    ScaffoldMessenger.of(context).showSnackBar(
       SnackBar(
        content: const Text("Wrong email or password!"),
        backgroundColor: AppColors.c303030.color,
      ),
    );

    /// user not found: error message
  }

  void goToSignUp(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(SignUpScreen.id);
  }
}
