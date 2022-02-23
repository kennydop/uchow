import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:u_chow/utils/colors.dart';
import 'package:u_chow/utils/constants.dart';
import 'package:u_chow/widgets/dish/explore_dish.dart';
import 'package:u_chow/widgets/dish/recent_dish.dart';
import 'package:u_chow/widgets/text.dart';
import 'package:u_chow/utils/dummydata.dart';

class Explore extends StatefulWidget {
  const Explore({Key? key}) : super(key: key);

  @override
  _ExploreState createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  var filterSelected = 0;
  var restaurantSelected = 0;
  final List<String> filterMethods = ["Popular", "Vegetarian", "< 30mins"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.bgColor,
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
                              AppText(text: "Jude")
                            ]),
                            InkWell(
                              onTap: () {
                                Get.toNamed("/profile");
                              },
                              child: Ink(
                                child: CircleAvatar(
                                  backgroundColor: AppColors.secondaryColor,
                                  backgroundImage: const AssetImage(
                                      'assets/images/pass.jpg'),
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
                            AppText(
                                text: "What do you want for ", type: 'title'),
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
                    vertical: AppMargin.vertical,
                    horizontal: AppMargin.horizontal),
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
                            Get.toNamed("/filter");
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
                      margin: EdgeInsets.symmetric(
                          horizontal: AppMargin.horizontal),
                      child: AppText(text: 'Recent')),
                  SizedBox(
                    height: logicalHeight * 0.35,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          var dish = dishes[index];
                          var restaurant = restaurants
                              .where((element) =>
                                  element["uid"] == dish["restaurantID"])
                              .toList();
                          return Center(
                            child: RecentDish(
                              dish: dish,
                              restaurant_: restaurant,
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
                              .where((element) =>
                                  element["uid"] == dish["restaurantID"])
                              .toList();
                          return ExploreDish(
                            dish: dish,
                            restaurant_: restaurant,
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
