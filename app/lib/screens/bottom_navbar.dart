import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uchow/controllers/user_controller.dart';
import 'package:uchow/screens/bag.dart';
import 'package:uchow/screens/explore.dart';
import 'package:uchow/screens/favorites.dart';
import 'package:uchow/services/api.dart';
import 'package:uchow/utils/app_icons.dart';
import 'package:uchow/utils/colors.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({Key? key}) : super(key: key);

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
    final userController = Get.find<UserController>();
    final Api api = Api();

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
          userController.refreshToken();
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
