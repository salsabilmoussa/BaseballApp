import 'package:baseball_cards_app/shared/tokens/app_colors.dart';
import 'package:baseball_cards_app/shared/tokens/app_sizes.dart';
import 'package:flutter/material.dart';

class AppTextStyles {
  static const TextStyle buttonText = TextStyle(
    fontSize: AppSizes.h_18,
    color: AppColors.secondaryColor,
  );

  static const TextStyle cardTitle = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle title = TextStyle(
      fontSize: AppSizes.h_22,
      fontWeight: FontWeight.bold,
      color: Colors.black);

  static const TextStyle subtitle = TextStyle(
    color: Colors.grey,
    fontSize: AppSizes.h_18,
  );
}
