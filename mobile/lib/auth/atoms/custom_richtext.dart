import 'package:flutter/material.dart';

class CustomRichText extends StatelessWidget {
  final List<TextSpan> children;
  final double fontSize;
  final Color defaultColor;

  const CustomRichText({
    super.key,
    required this.children,
    this.fontSize = 14.0,
    this.defaultColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          fontSize: fontSize,
          color: defaultColor,
        ),
        children: children,
      ),
    );
  }
}
