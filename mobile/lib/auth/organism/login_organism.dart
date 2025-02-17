import 'package:baseball_cards_app/auth/molecules/login_input_molecule.dart';
import 'package:baseball_cards_app/shared/atoms/custom_button.dart';
import 'package:baseball_cards_app/auth/params.dart';
import 'package:baseball_cards_app/shared/tokens/app_colors.dart';
import 'package:baseball_cards_app/shared/tokens/app_sizes.dart';
import 'package:flutter/material.dart';

class LoginOrganism extends StatelessWidget {
  final LoginParams params;
  const LoginOrganism({super.key, required this.params});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        LoginInputMolecule(
            emailController: params.emailController,
            passwordController: params.passwordController,
            emailTextFieldHint: params.emailTextFieldHint,
            passwordTextFieldHint: params.passwordTextFieldHint),
        const SizedBox(height: AppSizes.h_25),
        CustomButton(
          text: params.buttonText,
          onPressed: () async {
            try {
              await params.service.login(
                  params.emailController.text, params.passwordController.text);
              if (params.service.isAuth) {
                Navigator.pushReplacementNamed(context, '/home');
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text('Email ou mot de passe incorrect')),
                );
              }
            } catch (e) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(e.toString())),
              );
            } finally {
              params.emailController.clear();
              params.passwordController.clear();
            }
          },
          backgroundColor: AppColors.primaryColor,
        )
      ],
    );
  }
}
