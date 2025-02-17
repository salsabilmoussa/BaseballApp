import 'package:baseball_cards_app/shared/tokens/app_colors.dart';
import 'package:baseball_cards_app/shared/tokens/app_sizes.dart';
import 'package:baseball_cards_app/shared/tokens/app_typography.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final VoidCallback onPressed;
  final Color textColor;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.backgroundColor,
    this.textColor = AppColors.secondaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.paddingHorizontal,
          vertical: AppSizes.paddingVertical,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.r_30),
        ),
      ),
      child: Text(
        text,
        style: AppTextStyles.buttonText.copyWith(color: textColor),
      ),
    );
  }
}
