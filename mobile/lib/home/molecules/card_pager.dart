import 'package:baseball_cards_app/shared/tokens/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:vertical_card_pager/vertical_card_pager.dart';

class CardPager extends StatelessWidget {
  final List<String> titles;
  final List<Widget> images;
  final Function(int) onSelectedItem;

  const CardPager({
    super.key,
    required this.titles,
    required this.images,
    required this.onSelectedItem,
  });

  @override
  Widget build(BuildContext context) {
    return VerticalCardPager(
      titles: titles,
      images: images,
      textStyle: AppTextStyles.cardTitle,
      initialPage: 2,
      align: ALIGN.CENTER,
      onSelectedItem: onSelectedItem,
    );
  }
}
