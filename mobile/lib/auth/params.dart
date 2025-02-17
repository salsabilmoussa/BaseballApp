import 'package:flutter/material.dart';

class HeaderParams {
  final String title;
  final String subtitle1;
  final String subtitle2;

  HeaderParams(this.title, this.subtitle1, this.subtitle2);
}

class LoginParams {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final String emailTextFieldHint;
  final String passwordTextFieldHint;
  final dynamic service;
  final String buttonText;

  LoginParams(this.buttonText,
      {required this.emailController,
      required this.passwordController,
      required this.emailTextFieldHint,
      required this.passwordTextFieldHint,
      required this.service});
}

class SignupParams {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final String emailTextFieldHint;
  final String passwordTextFieldHint;
  final String confirmPasswordTextFieldHint;
  final dynamic service;
  final String buttonText;

  SignupParams(this.buttonText,
      {required this.emailController,
      required this.passwordController,
      required this.confirmPasswordController,
      required this.confirmPasswordTextFieldHint,
      required this.emailTextFieldHint,
      required this.passwordTextFieldHint,
      required this.service});
}

class FooterParams {
  final String text1;
  final String text2;
  final String text3;

  const FooterParams(this.text1, this.text2, this.text3);
}
