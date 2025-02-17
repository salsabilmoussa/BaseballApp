import 'package:baseball_cards_app/auth/atoms/custom_richtext.dart';
import 'package:baseball_cards_app/auth/atoms/custom_text.dart';
import 'package:baseball_cards_app/auth/params.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final HeaderParams params;
  const Header({super.key, required this.params});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        CustomText(
          text: params.title,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 70.0),
          child: CustomRichText(
            children: <TextSpan>[
              TextSpan(text: params.subtitle1),
              TextSpan(
                text: params.subtitle2,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

