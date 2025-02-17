import 'package:baseball_cards_app/home/model/card.dart' as model;
import 'package:flutter/material.dart';
import 'package:baseball_cards_app/home/atoms/card_text.dart';

class CardDetailsSection extends StatelessWidget {
  final model.Card card;
  const CardDetailsSection({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CardText(label: 'Titre', value: card.name),
        const SizedBox(height: 10),
        CardText(label: 'Joueur', value: card.player),
        const SizedBox(height: 10),
        CardText(label: 'Équipe', value: card.team),
        const SizedBox(height: 10),
        CardText(label: 'Année', value: '${card.year}'),
      ],
    );
  }
}
