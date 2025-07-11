import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:trippify/constants/colors_constants.dart';

class IndexScreen extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const IndexScreen({super.key, required this.navigationShell});

  void _onTap(index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: navigationShell,
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  Widget _bottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: navigationShell.currentIndex,
      onTap: _onTap,
      backgroundColor: ColorsConstants.blueColor,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.lightBlue.shade100,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Symbols.home_rounded,
            size: 30,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Symbols.add_rounded,
            size: 30,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Symbols.bookmark_rounded,
            size: 30,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Symbols.person_filled_rounded,
            size: 30,
          ),
          label: '',
        ),
      ],
    );
  }
}
