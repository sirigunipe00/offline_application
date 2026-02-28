
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:offline_first/styles/app_color.dart';

class AppScaffoldWidget extends StatelessWidget {
  const AppScaffoldWidget({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithNavigationBar(
      body: navigationShell,
      selectedIndex: navigationShell.currentIndex,
      onDestinationSelected: _goBranch,
    );
  }
}

class ScaffoldWithNavigationBar extends StatelessWidget {
  const ScaffoldWithNavigationBar({
    super.key,
    required this.body,
    required this.selectedIndex,
    required this.onDestinationSelected,
  });
  final Widget body;
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.white,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.white),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12.0),
            topRight: Radius.circular(12.0)
          ),
        ),
        child: NavigationBar(
          indicatorColor: AppColors.black.withValues(alpha: 0.3),
          backgroundColor: AppColors.white,
          selectedIndex: selectedIndex,
          height: 60,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          destinations: const [
            NavigationDestination(
              label: 'Welcome Home', 
              icon: Icon(Icons.home_outlined), 
              selectedIcon: Icon(Icons.home, color: AppColors.white),
            ),
            NavigationDestination(
              label: 'Profile', 
              icon: Icon(Icons.person_outline), 
              selectedIcon: Icon(Icons.person, color: AppColors.white),
            ),
          ],
          onDestinationSelected: onDestinationSelected,
        ),
      ),
    );
  }
}
