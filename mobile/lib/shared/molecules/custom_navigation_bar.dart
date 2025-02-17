import 'package:baseball_cards_app/shared/atoms/navigation_destination.dart';
import 'package:baseball_cards_app/shared/tokens/app_colors.dart';
import 'package:baseball_cards_app/shared/tokens/app_sizes.dart';
import 'package:flutter/material.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({super.key});

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  int currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    final size = AppSizes.mediaQuery(context);

    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 10),
        ],
      ),
      child: NavigationBar(
        height: size.height * 0.09,
        backgroundColor: AppColors.secondaryColor,
        selectedIndex: currentIndex,
        onDestinationSelected: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        destinations: [
          CustomNavigationDestination(
            icon: Icons.account_circle_outlined,
            label: 'Profile',
            isSelected: currentIndex == 0,
          ),
          CustomNavigationDestination(
            icon: Icons.home_outlined,
            label: 'Accueil',
            isSelected: currentIndex == 1,
          ),
          CustomNavigationDestination(
            icon: Icons.notifications_outlined,
            label: 'Notifications',
            isSelected: currentIndex == 2,
          ),
        ],
      ),
    );
  }
}
