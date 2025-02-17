import 'package:baseball_cards_app/shared/tokens/app_colors.dart';
import 'package:baseball_cards_app/shared/tokens/app_sizes.dart';
import 'package:flutter/material.dart';

class TextfieldAtom extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Widget? prefixIcon;
  final bool obscureText;

  const TextfieldAtom({
    super.key,
    required this.controller,
    required this.hintText,
    this.prefixIcon,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizes.r_18),
          borderSide: const BorderSide(
            color: AppColors.primaryColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.primaryColor,
          ),
          borderRadius: BorderRadius.circular(AppSizes.r_20),
        ),
        fillColor: const Color.fromARGB(255, 254, 247, 255),
        filled: true,
        prefixIcon: prefixIcon,
      ),
    );
  }
}
