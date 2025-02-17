import 'package:baseball_cards_app/shared/atoms/textfield_atom.dart';
import 'package:baseball_cards_app/shared/tokens/app_sizes.dart';
import 'package:flutter/material.dart';

class LoginInputMolecule extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final String emailTextFieldHint;
  final String passwordTextFieldHint;

  const LoginInputMolecule(
      {super.key,
      required this.emailController,
      required this.passwordController,
      required this.emailTextFieldHint,
      required this.passwordTextFieldHint});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      TextfieldAtom(
          controller: emailController,
          hintText: emailTextFieldHint,
          prefixIcon: const Icon(Icons.person),
          obscureText: false),
      const SizedBox(height: AppSizes.h_12),
      TextfieldAtom(
          controller: passwordController,
          hintText: passwordTextFieldHint,
          prefixIcon: const Icon(Icons.lock),
          obscureText: true),
    ]);
  }
}
