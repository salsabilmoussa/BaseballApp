import 'package:baseball_cards_app/home/organism/home_organism.dart';
import 'package:baseball_cards_app/home/service/home_service.dart';
import 'package:baseball_cards_app/shared/atoms/custom_appbar.dart';
import 'package:baseball_cards_app/shared/molecules/custom_navigation_bar.dart';
import 'package:flutter/material.dart';


class HomeTemplate extends StatelessWidget {
  final List<String> titles;
  final List<Widget> images;
  final Function(int) onSelectedItem;
  final HomeService service;

  const HomeTemplate({
    super.key,
    required this.titles,
    required this.images,
    required this.onSelectedItem,
    required this.service,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: const CustomAppbar(),
      body: SafeArea(
        child: HomeOrganism(
          titles: titles,
          images: images,
          onSelectedItem: onSelectedItem,
          service: service,
        ),
      ),
      bottomNavigationBar: const CustomNavigationBar(),
    );
  }
}
