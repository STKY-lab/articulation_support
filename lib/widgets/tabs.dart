import 'package:articulation_support/screens/input_text.dart';
import 'package:articulation_support/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class Tabs extends StatelessWidget {
  const Tabs({super.key});
  static const routeName = "/tabs";

  @override
  Widget build(BuildContext context) {
    final screenInfo = <Widget>[
      const Home(),
      const InputText(),
    ];
    return Scaffold(
      body: PersistentTabView(
        context,
        screens: screenInfo,
        items: [
          PersistentBottomNavBarItem(
            iconSize: 30,
            inactiveIcon: const Icon(
              Icons.home_outlined,
            ),
            icon: const Icon(
              Icons.home_rounded,
            ),
            activeColorPrimary: Theme.of(context).colorScheme.inversePrimary,
          ),
          PersistentBottomNavBarItem(
            inactiveIcon: const Icon(Icons.keyboard_alt_outlined),
            icon: const Icon(Icons.keyboard_alt_rounded),
            iconSize: 30,
            activeColorPrimary: Theme.of(context).colorScheme.inversePrimary,
          )
        ],
        navBarStyle: NavBarStyle.style6,
        backgroundColor: Theme.of(context).colorScheme.primary,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
      ),
    );
  }
}
