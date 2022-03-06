import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uchow/controllers/bag_controller.dart';
import 'package:uchow/controllers/user_controller.dart';
import 'package:uchow/screens/auth/signin.dart';
import 'package:uchow/screens/auth/singup.dart';
import 'package:uchow/screens/bottom_navbar.dart';
import 'package:uchow/screens/bag.dart';
import 'package:uchow/screens/dishdetail.dart';
import 'package:uchow/screens/explore.dart';
import 'package:uchow/screens/favorites.dart';
import 'package:uchow/screens/search/filter.dart';
import 'package:uchow/screens/profile.dart';
import 'package:uchow/screens/search/search.dart';
import 'package:uchow/screens/search/search_results.dart';
import 'package:get_storage/get_storage.dart';
import 'package:uchow/utils/colors.dart';

void main() async {
  await GetStorage.init();
  runApp(const UChow());
}

class UChow extends StatelessWidget {
  const UChow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BagController bagController = Get.put(BagController());
    final UserController userController = Get.put(UserController());

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
        GetPage(name: "/signup", page: () => const SingUp()),
      ],
      initialRoute: userController.user.id == 0 ? "/signin" : "/",
    );
  }
}
