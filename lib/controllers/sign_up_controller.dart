import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app/controllers/base_controller.dart';
import 'package:furniture_app/models/user_model.dart';
import 'package:furniture_app/screens/sing_in_screen.dart';
import 'package:furniture_app/services/data/database/users.dart';

class SignUpController extends BaseController {
  TextEditingController nameController;
  TextEditingController emailController;
  TextEditingController passwordController;
  TextEditingController rePasswordController;

  void Function(void Function())? updater;
  bool isLoading = false;

  SignUpController({this.updater})
      : nameController = TextEditingController(),
        emailController = TextEditingController(),
        passwordController = TextEditingController(),
        rePasswordController = TextEditingController();

  @override
  void close() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    rePasswordController.dispose();
    super.close();
  }

  void signUp(BuildContext context) async {
    isLoading = true;
    updater!(() {});

    String name = nameController.text.trim();
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String rePassword = rePasswordController.text.trim();

    final nameValid = RegExp(r'^[a-zA-Z ]+$');
    final emailValid = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    final passwordValid =
        RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$');

    bool checkName = nameValid.hasMatch(name);
    bool checkEmail = emailValid.hasMatch(email);
    bool checkPassword = passwordValid.hasMatch(password);
    bool checkRePassword = rePassword == password;

    debugPrint(name);
    debugPrint(email);
    debugPrint(password);
    debugPrint(rePassword);

    await Future.delayed(const Duration(seconds: 2));
    isLoading = false;
    updater!(() {});

    bool existUser = false;

    for(int i = 0; i < usersList.length; i++) {
      if(usersList[i].email == email) {
        existUser = true;
        debugPrint("USER BOR!!!");
        break;
      } else {
        debugPrint("${usersList[i].email} != $email");
      }
    }


    if (checkName && checkEmail && checkPassword && checkRePassword && !existUser) {
      int userId = int.parse(usersList.last.userId) + 1;

      final newUser = User(
        userId: userId.toString(),
        name: name,
        email: email,
        password: password,
        createdAt: DateTime.now().toString(),
        modifyAt: DateTime.now().toString(),
        devices: [],
        cards: [],
        favourites: [],
      );

      usersList.add(newUser);
      debugPrint("Success");
      Navigator.of(context).pushReplacementNamed(SignInScreen.id);
    } else {
      debugPrint("Invalid data");
    }
  }

  void goToSignIn(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(SignInScreen.id);
  }
}
