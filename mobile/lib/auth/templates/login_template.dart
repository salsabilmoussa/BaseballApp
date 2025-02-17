import 'package:baseball_cards_app/auth/atoms/forgot_password_button.dart';
import 'package:baseball_cards_app/auth/organism/login_organism.dart';
import 'package:baseball_cards_app/auth/params.dart';
import 'package:flutter/material.dart';
import 'package:baseball_cards_app/auth/molecules/header.dart';
import 'package:baseball_cards_app/auth/atoms/signup_button.dart';

class LoginTemplate extends StatelessWidget {
  final LoginParams loginParams;
  final HeaderParams headerParams;
  final FooterParams footerParams;
  const LoginTemplate(
      {super.key,
      required this.loginParams,
      required this.headerParams,
      required this.footerParams});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Header(params: headerParams),
        LoginOrganism(params: loginParams),
        ForgotPasswordButton(text: footerParams.text1),
        SignupButton(
          text1: footerParams.text2,
          text2: footerParams.text3,
        ),
      ],
    );
  }
}
