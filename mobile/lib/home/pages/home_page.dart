import 'package:baseball_cards_app/home/atoms/custom_progress_indicator.dart';
import 'package:baseball_cards_app/home/service/home_service.dart';
import 'package:baseball_cards_app/home/templates/home_template.dart';
import 'package:baseball_cards_app/shared/tokens/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeService service = Modular.get<HomeService>();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: service,
      child: Consumer<HomeService>(
        builder: (context, provider, _) {
          if (provider.cards.isEmpty) {
            return const Scaffold(body: CustomProgressIndicator());
          }

          final List<String> titles =
              provider.cards.map((card) => card.name).toList();
          final List<Widget> images = provider.cards.map((card) {
            return Hero(
              tag: 'card-${card.id ?? 0}',
              child: ClipRRect(
                borderRadius: BorderRadius.circular(AppSizes.r_18),
                child: Image.network(
                  card.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            );
          }).toList();

          return HomeTemplate(
            titles: titles,
            images: images,
            onSelectedItem: (index) {
              final selectedCard = provider.cards[index];
              Modular.to.pushNamed('/home/details', arguments: selectedCard);
            },
            service: provider,
          );
        },
      ),
    );
  }
}
