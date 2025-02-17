import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginButton extends StatelessWidget {
  final String text1;
  final String text2;
  const LoginButton({super.key, required this.text1, required this.text2});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text1),
        TextButton(
            onPressed: () {
              Modular.to.pushNamed('/');
            },
            child: Text(text2))
      ],
    );
  }
}
