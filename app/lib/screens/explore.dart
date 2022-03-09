import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uchow/controllers/user_controller.dart';
import 'package:uchow/models/user_model.dart';
import 'package:uchow/utils/colors.dart';
import 'package:uchow/utils/constants.dart';
import 'package:uchow/widgets/dish/explore_dish.dart';
import 'package:uchow/widgets/dish/recent_dish.dart';
import 'package:uchow/widgets/text.dart';
import 'package:uchow/utils/dummydata.dart';

class Explore extends StatefulWidget {
  const Explore({Key? key}) : super(key: key);

  @override
  _ExploreState createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  var filterSelected = 0;
  var restaurantSelected = 0;
  final List<String> filterMethods = ["Popular", "Vegetarian", "< 30mins"];
  final UserController userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    UserModel user = userController.user;
    return Scaffold(
        body: SingleChildScrollView(
      padding: EdgeInsets.only(top: AppDimensions.height22),
      child: Column(
        children: [
          Container(
              margin: EdgeInsets.fromLTRB(AppMargin.horizontal,
                  AppMargin.vertical, AppMargin.horizontal, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: [
                          AppText(text: "Good Morning, "),
                          AppText(text: user.name.split(" ")[0])
                        ]),
                        InkWell(
                          onTap: () {
                            Get.toNamed("/profile");
                          },
                          child: Ink(
                            child: CircleAvatar(
                              backgroundColor: AppColors.white,
                              backgroundImage: NetworkImage(user.image!.isEmpty
                                  ? "https://cdn.business2community.com/wp-content/uploads/2014/08/My_profile-orange.png"
                                  : user.image!),
                              minRadius: AppDimensions.height20,
                              maxRadius: AppDimensions.height20,
                            ),
                          ),
                        )
                      ]),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        AppText(text: "What do you want for ", type: 'title'),
                        AppText(
                            text: "breakfast?",
                            type: 'title',
                            color: AppColors.primaryColor)
                      ])
                ],
              )),
          Container(
            width: logicalWidth - (AppMargin.horizontal * 2),
            height: AppDimensions.height38,
            margin: EdgeInsets.symmetric(
                vertical: AppMargin.vertical, horizontal: AppMargin.horizontal),
            padding: EdgeInsets.only(left: AppMargin.horizontal),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppDimensions.height10),
                border: Border.all(color: AppColors.primaryColor)),
            child: InkWell(
              onTap: () {
                Get.toNamed("/search");
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(text: "Search", color: AppColors.subTextColor),
                  IconButton(
                      onPressed: () {
                        Get.toNamed("/search/filter");
                      },
                      icon: const Icon(Icons.tune_rounded,
                          color: AppColors.primaryColor)),
                ],
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: AppMargin.horizontal),
                  child: AppText(text: 'Recent')),
              SizedBox(
                height: logicalHeight * 0.35,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      var dish = dishes[index];
                      var restaurant = restaurants
                          .where((element) => element.uid == dish.restaurantID);
                      return Center(
                        child: RecentDish(
                          dish: dish,
                          restaurant: restaurant.single,
                        ),
                      );
                    }),
              )
            ],
          ),
          SizedBox(
            height: AppMargin.vertical,
          ),
          Column(
            children: [
              SizedBox(
                height: AppDimensions.height40,
                child: ListView.builder(
                  itemCount: filterMethods.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: AppMargin.horizontal),
                      child: FilterChip(
                          label: AppText(
                              text: filterMethods[index],
                              color: filterSelected == index
                                  ? AppColors.secondaryColor
                                  : AppColors.textColor),
                          selected: filterSelected == index,
                          selectedColor: AppColors.primaryColor,
                          showCheckmark: false,
                          onSelected: (bool value) {
                            setState(() {
                              filterSelected = index;
                            });
                          }),
                    );
                  },
                ),
              ),
              SizedBox(
                height: AppMargin.vertical,
              ),
              MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: dishes.length,
                    itemBuilder: (context, index) {
                      var dish = dishes[index];
                      var restaurant = restaurants
                          .where((element) => element.uid == dish.restaurantID);
                      return ExploreDish(
                        dish: dish,
                        restaurant: restaurant.single,
                      );
                    }),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
