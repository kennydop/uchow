import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:u_chow/controllers/bag_controller.dart';
import 'package:u_chow/screens/auth/signin.dart';
import 'package:u_chow/screens/auth/singup.dart';
import 'package:u_chow/screens/bottom_navbar.dart';
import 'package:u_chow/screens/bag.dart';
import 'package:u_chow/screens/dishdetail.dart';
import 'package:u_chow/screens/explore.dart';
import 'package:u_chow/screens/favorites.dart';
import 'package:u_chow/screens/search/filter.dart';
import 'package:u_chow/screens/profile.dart';
import 'package:u_chow/screens/search/search.dart';
import 'package:u_chow/screens/search/search_results.dart';
import 'package:get_storage/get_storage.dart';
import 'package:u_chow/utils/colors.dart';

void main() async {
  await GetStorage.init();
  runApp(const UChow());
}

class UChow extends StatelessWidget {
  const UChow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BagController bagController = Get.put(BagController());

    return GetMaterialApp(
      title: 'UChow',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.bgColor,
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
        GetPage(name: "/search/filter", page: () => const Filter()),
        GetPage(name: "/search/results", page: () => const SearchResults()),
        GetPage(name: "/signin", page: () => const SignIn()),
        GetPage(name: "/signup", page: () => const SignUp()),
      ],
      initialRoute: "/signin",
    );
  }
}
