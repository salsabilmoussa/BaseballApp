import 'package:flutter/material.dart';

class ForgotPasswordButton extends StatelessWidget {
  final String text;
  const ForgotPasswordButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: () {}, child: Text(text));
  }
}
