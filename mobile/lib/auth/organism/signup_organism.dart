import 'package:baseball_cards_app/auth/molecules/signup_input.dart';
import 'package:baseball_cards_app/shared/atoms/custom_button.dart';
import 'package:baseball_cards_app/auth/params.dart';
import 'package:baseball_cards_app/shared/tokens/app_colors.dart';
import 'package:baseball_cards_app/shared/tokens/app_sizes.dart';
import 'package:flutter/material.dart';

class SignupOrganism extends StatelessWidget {
  final SignupParams params;
  const SignupOrganism({super.key, required this.params});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SignupInputMolecule(
          emailController: params.emailController,
          passwordController: params.passwordController,
          emailTextFieldHint: params.emailTextFieldHint,
          passwordTextFieldHint: params.passwordTextFieldHint,
          confirmPasswordController: params.confirmPasswordController,
          confirmPasswordTextFieldHint: params.confirmPasswordTextFieldHint,
        ),
        const SizedBox(height: AppSizes.h_25),
        CustomButton(
          text: params.buttonText,
          onPressed: () {},
          backgroundColor: AppColors.primaryColor,
        )
      ],
    );
  }
}
