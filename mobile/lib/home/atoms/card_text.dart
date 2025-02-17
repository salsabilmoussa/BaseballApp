import 'package:flutter/material.dart';
import 'package:baseball_cards_app/shared/tokens/app_typography.dart';

class CardText extends StatelessWidget {
  final String label;
  final String value;

  const CardText({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      '$label: $value',
      style: AppTextStyles.subtitle,
    );
  }
}
