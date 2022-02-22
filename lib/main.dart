import 'package:flutter/material.dart';
import 'package:u_chow/screens/bottom_navbar.dart';
import 'package:u_chow/screens/bag.dart';
import 'package:u_chow/screens/dishdetail.dart';
import 'package:u_chow/screens/explore.dart';
import 'package:u_chow/screens/favorites.dart';
import 'package:u_chow/screens/filter.dart';
import 'package:u_chow/screens/profile.dart';
import 'package:u_chow/screens/search.dart';
import 'package:u_chow/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UChow',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Raleway',
      ),
      routes: {
        BottomNavbar.routeName: (ctx) => const BottomNavbar(),
        Explore.routeName: (ctx) => const Explore(),
        DishDetail.routeName: (ctx) => const DishDetail(),
        Bag.routeName: (ctx) => const Bag(),
        Profile.routeName: (ctx) => const Profile(),
        Favorites.routeName: (ctx) => const Favorites(),
        Search.routeName: (ctx) => const Search(),
        Filter.routeName: (ctx) => const Filter(),
      },
      home: const BottomNavbar(),
    );
  }
}
