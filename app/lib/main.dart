import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:u_chow/controllers/bag_controller.dart';
import 'package:u_chow/screens/bottom_navbar.dart';
import 'package:u_chow/screens/bag.dart';
import 'package:u_chow/screens/dishdetail.dart';
import 'package:u_chow/screens/explore.dart';
import 'package:u_chow/screens/favorites.dart';
import 'package:u_chow/screens/filter.dart';
import 'package:u_chow/screens/profile.dart';
import 'package:u_chow/screens/search.dart';
import 'package:u_chow/screens/search_results.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BagController bagController = Get.put(BagController());

    return GetMaterialApp(
      title: 'UChow',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Raleway',
      ),
      getPages: [
        GetPage(name: "/", page: () => const BottomNavbar()),
        GetPage(name: "/explore", page: () => const Explore()),
        GetPage(name: "/dishdetail", page: () => const DishDetail()),
        GetPage(name: "/bag", page: () => const Bag()),
        GetPage(name: "/profile", page: () => const Profile()),
        GetPage(name: "/favorites", page: () => const Favorites()),
        GetPage(name: "/search", page: () => const Search()),
        GetPage(name: "/filter", page: () => const Filter()),
        GetPage(name: "/searchresults", page: () => const SearchResults()),
      ],
      initialRoute: "/",
    );
  }
}
