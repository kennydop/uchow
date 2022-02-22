import 'package:flutter/material.dart';
import 'package:u_chow/screens/bag.dart';
import 'package:u_chow/screens/explore.dart';
import 'package:u_chow/screens/favorites.dart';
import 'package:u_chow/utils/app_icons.dart';
import 'package:u_chow/utils/colors.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({Key? key}) : super(key: key);
  static const routeName = "/bnavbar";

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  final List _pages = [
    const Explore(),
    const Favorites(),
    const Bag(),
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.white,
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: AppColors.subTextColor,
        currentIndex: _currentIndex,
        onTap: (int i) {
          setState(() {
            _currentIndex = i;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(AppIcons.wpexplorer),
              label: "Explore",
              tooltip: "Explore"),
          BottomNavigationBarItem(
              icon: Icon(AppIcons.heart_empty),
              label: "Favorites",
              tooltip: "Favorites"),
          BottomNavigationBarItem(
              icon: Icon(AppIcons.bag), label: "Bag", tooltip: "Bag"),
        ],
      ),
    );
  }
}
