import 'package:baseball_cards_app/shared/atoms/custom_button.dart';
import 'package:baseball_cards_app/home/molecules/card_pager.dart';
import 'package:baseball_cards_app/home/service/home_service.dart';
import 'package:baseball_cards_app/shared/molecules/custom_show_dialog.dart';
import 'package:baseball_cards_app/shared/tokens/app_colors.dart';
import 'package:baseball_cards_app/shared/tokens/app_sizes.dart';
import 'package:flutter/material.dart';

class HomeOrganism extends StatelessWidget {
  final List<String> titles;
  final List<Widget> images;
  final Function(int) onSelectedItem;
  final HomeService service;

  const HomeOrganism({
    super.key,
    required this.titles,
    required this.images,
    required this.onSelectedItem,
    required this.service,
  });

  @override
  Widget build(BuildContext context) {
    final size = AppSizes.mediaQuery(context);

    return Stack(
      children: [
        Column(
          children: [
            SizedBox(height: size.height * 0.09, width: double.infinity),
            Expanded(
              child: CardPager(
                titles: titles,
                images: images,
                onSelectedItem: onSelectedItem,
              ),
            ),
          ],
        ),
        Positioned(
          top: 15,
          right: 10,
          child: CustomButton(
            text: 'Ajouter',
            onPressed: () {
              service.isAddDialog = true;
              CustomShowDialog.show(
                  context, service, 0, 'Ajouter une carte', 'Ajouter');
            },
            backgroundColor: AppColors.primaryColor,
          ),
        ),
      ],
    );
  }
}
