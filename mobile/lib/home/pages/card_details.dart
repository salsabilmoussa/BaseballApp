import 'package:baseball_cards_app/home/model/card.dart' as model;
import 'package:baseball_cards_app/home/service/home_service.dart';
import 'package:baseball_cards_app/home/templates/card_details_template.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CardDetails extends StatefulWidget {
  const CardDetails({super.key});

  @override
  State<CardDetails> createState() => _CardDetailsState();
}

class _CardDetailsState extends State<CardDetails> {
  final HomeService service = Modular.get<HomeService>();
  model.Card card = Modular.args.data;

  @override
  Widget build(BuildContext context) {
    return CardDetailsTemplate(
      card: card,
      service: service,
    );
  }

}
