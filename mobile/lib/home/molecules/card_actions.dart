import 'package:flutter/material.dart';
import 'package:baseball_cards_app/shared/atoms/custom_button.dart';
import 'package:baseball_cards_app/home/service/home_service.dart';
import 'package:baseball_cards_app/shared/molecules/custom_show_dialog.dart';
import 'package:provider/provider.dart';

class CardActions extends StatelessWidget {
  final int? cardId;

  const CardActions({super.key, required this.cardId});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeService>(context, listen: false);

    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomButton(
            text: 'Modifier',
            onPressed: () async {
              provider.isAddDialog = false;
              CustomShowDialog.show(context, provider, cardId, 'Modifier la carte', 'Modifier');
              await provider.showCard(cardId);
            },
            backgroundColor: Colors.blue,
          ),
          const SizedBox(width: 20),
          CustomButton(
            text: 'Supprimer',
            onPressed: () async {
              await provider.deleteCard(cardId);
              Navigator.of(context).pushNamed('/home');
            },
            backgroundColor: Colors.red,
          ),
        ],
      ),
    );
  }
}
