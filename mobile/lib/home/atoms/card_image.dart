import 'package:flutter/material.dart';

class CardImage extends StatelessWidget {
  final String imageUrl;

  const CardImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Image.network(imageUrl, fit: BoxFit.cover),
    );
  }
}
