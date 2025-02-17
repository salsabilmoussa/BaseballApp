import 'package:baseball_cards_app/auth/atoms/login_button.dart';
import 'package:baseball_cards_app/auth/organism/signup_organism.dart';
import 'package:baseball_cards_app/auth/params.dart';
import 'package:flutter/material.dart';
import 'package:baseball_cards_app/auth/molecules/header.dart';

class SignupTemplate extends StatelessWidget {
  final SignupParams signupParams;
  final HeaderParams headerParams;
  final FooterParams footerParams;
  const SignupTemplate(
      {super.key,
      required this.signupParams,
      required this.headerParams,
      required this.footerParams});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Header(params: headerParams),
        SignupOrganism(params: signupParams),
        LoginButton(
          text1: footerParams.text2,
          text2: footerParams.text3,
        ),
      ],
    );
  }
}
