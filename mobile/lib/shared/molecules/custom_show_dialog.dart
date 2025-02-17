import 'package:baseball_cards_app/home/service/home_service.dart';
import 'package:baseball_cards_app/shared/atoms/custom_button.dart';
import 'package:baseball_cards_app/shared/atoms/textfield_atom.dart';
import 'package:baseball_cards_app/shared/tokens/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:baseball_cards_app/home/model/card.dart' as model;

class CustomShowDialog {
  static void show(
    BuildContext context,
    HomeService service,
    int? cardId,
    String title,
    String buttonText,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextfieldAtom(
                  controller: service.nameController,
                  hintText: 'Titre',
                  obscureText: false,
                ),
                const SizedBox(height: 10),
                TextfieldAtom(
                  controller: service.playerController,
                  hintText: 'Joueur',
                  obscureText: false,
                ),
                const SizedBox(height: 10),
                TextfieldAtom(
                  controller: service.teamController,
                  hintText: 'Equipe',
                  obscureText: false,
                ),
                const SizedBox(height: 10),
                TextfieldAtom(
                  controller: service.yearController,
                  hintText: 'Année',
                  obscureText: false,
                ),
                const SizedBox(height: 10),
                TextfieldAtom(
                  controller: service.imageController,
                  hintText: 'image',
                  obscureText: false,
                ),
              ],
            ),
          ),
          actions: [
            CustomButton(
              text: 'Annuler',
              onPressed: () {
                Navigator.of(context).pop();
                service.clearControllers();
              },
              backgroundColor: AppColors.buttonColor,
              textColor: AppColors.textColor,
            ),
            CustomButton(
              text: buttonText,
              onPressed: () async {
                model.Card card = model.Card(
                  name: service.nameController.text,
                  player: service.playerController.text,
                  team: service.teamController.text,
                  year: int.parse(service.yearController.text),
                  imageUrl: service.imageController.text,
                );
                service.isAddDialog
                    ? await service.addCard(card)
                    : await service.editCard(cardId, card);
                service.clearControllers();
                Navigator.of(context).pop();
              },
              backgroundColor: AppColors.buttonColor,
              textColor: AppColors.textColor,
            ),
          ],
        );
      },
    );
  }
}
