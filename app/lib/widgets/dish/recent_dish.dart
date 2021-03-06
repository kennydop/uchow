import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uchow/models/dish_model.dart';
import 'package:uchow/models/restaurant_model.dart';
import 'package:uchow/utils/app_icons.dart';
import 'package:uchow/utils/colors.dart';
import 'package:uchow/utils/constants.dart';
import 'package:uchow/widgets/iconanddata.dart';
import 'package:uchow/widgets/text.dart';

class RecentDish extends StatelessWidget {
  final DishModel dish;
  final RestaurantModel restaurant;

  const RecentDish({
    Key? key,
    required this.dish,
    required this.restaurant,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double boxHeight = logicalHeight * 0.33;
    double boxWidth = logicalWidth * 0.45555;
    return Container(
      width: boxWidth,
      height: boxHeight,
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.symmetric(
          horizontal: AppMargin.horizontal, vertical: AppMargin.vertical),
      padding: EdgeInsets.all(AppDimensions.height0p5),
      decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(AppDimensions.height16),
          boxShadow: [
            BoxShadow(
                color: AppColors.secondaryColor.withOpacity(0.14),
                spreadRadius: 1,
                blurRadius: 6,
                offset: const Offset(1.6, 2.6))
          ]),
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppDimensions.height16),
        ),
        child: Stack(children: [
          InkWell(
            onTap: () {
              Get.toNamed("/dishdetail", arguments: {
                "dish": dish,
                "restaurant": restaurant,
              });
            },
            child: Ink(
              child: Column(
                children: [
                  Container(
                    height: boxHeight * 0.53,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                        color: AppColors.secondaryColor,
                        image: DecorationImage(
                          image: AssetImage(dish.image),
                          fit: BoxFit.cover,
                        )),
                  ),
                  Container(
                    padding: EdgeInsets.all(AppDimensions.height3),
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        AppText(
                            text: dish.name,
                            type: 'title',
                            size: AppDimensions.height16),
                        SizedBox(
                          height: AppDimensions.height3,
                        ),
                        AppText(
                          text: restaurant.name,
                          size: AppDimensions.height12,
                          color: AppColors.subTextColor,
                        ),
                        SizedBox(
                          height: AppDimensions.height3,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconAndData(icon: AppIcons.clock, text: "30mins"),
                            SizedBox(
                              width: AppDimensions.width10,
                            ),
                            IconAndData(
                                icon: AppIcons.star_1,
                                text: "3.76",
                                iconSize: AppDimensions.height11),
                          ],
                        ),
                        SizedBox(height: AppDimensions.height3),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AppText(
                                text: "GH??? ",
                                type: 'title',
                                size: AppDimensions.height12),
                            AppText(
                                text: dish.price[0].toStringAsFixed(2),
                                type: 'title',
                                size: AppDimensions.height16)
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
              top: 6,
              right: 6,
              child: InkWell(
                onTap: () {},
                child: Ink(
                  child: Container(
                    height: 28,
                    width: 28,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(99999999),
                    ),
                    child: Icon(
                      AppIcons.heart_1,
                      size: AppDimensions.height16,
                      color: AppColors.secondaryColor,
                    ),
                  ),
                ),
              ))
        ]),
      ),
    );
  }
}
