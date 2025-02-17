import 'package:baseball_cards_app/home/organism/card_details_organism.dart';
import 'package:flutter/material.dart';
import 'package:baseball_cards_app/home/atoms/button_arrow.dart';
import 'package:baseball_cards_app/home/model/card.dart' as model;
import 'package:baseball_cards_app/home/service/home_service.dart';

class CardDetailsTemplate extends StatelessWidget {
  final model.Card card;
  final HomeService service;

  const CardDetailsTemplate({
    super.key,
    required this.card,
    required this.service,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              child: Image.network(card.imageUrl),
            ),
            const ButtonArrow(),
            CardDetailsOrganism(card: card, service: service),
          ],
        ),
      ),
    );
  }
}