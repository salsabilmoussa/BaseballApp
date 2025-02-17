import 'package:baseball_cards_app/shared/tokens/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:baseball_cards_app/home/molecules/card_actions.dart';
import 'package:baseball_cards_app/home/molecules/card_details_section.dart';
import 'package:baseball_cards_app/home/model/card.dart' as model;
import 'package:baseball_cards_app/home/service/home_service.dart';
import 'package:provider/provider.dart';

class CardDetailsOrganism extends StatelessWidget {
  final model.Card card;
  final HomeService service;

  const CardDetailsOrganism({
    super.key,
    required this.card,
    required this.service,
  });

  @override
  Widget build(BuildContext context) {
    final size = AppSizes.mediaQuery(context);

    return DraggableScrollableSheet(
      initialChildSize: 0.6,
      maxChildSize: 1.0,
      minChildSize: 0.6,
      builder: (context, scrollController) {
        return ChangeNotifierProvider.value(
          value: service,
          child: Consumer<HomeService>(
            builder: (context, provider, _) {
              return Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppSizes.paddingHorizontal),
                clipBehavior: Clip.hardEdge,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(AppSizes.r_20),
                    topRight: Radius.circular(AppSizes.r_20),
                  ),
                ),
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: AppSizes.h_10,
                          bottom: AppSizes.h_25,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 5,
                              width: 35,
                              color: Colors.black12,
                            ),
                          ],
                        ),
                      ),
                      CardDetailsSection(
                        card: card,
                      ),
                      SizedBox(height: size.height * 0.1),
                      CardActions(
                        cardId: card.id,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
