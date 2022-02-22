import 'package:flutter/material.dart';
import 'package:u_chow/screens/dishdetail.dart';
import 'package:u_chow/utils/app_icons.dart';
import 'package:u_chow/utils/colors.dart';
import 'package:u_chow/utils/constants.dart';
import 'package:u_chow/widgets/iconanddata.dart';
import 'package:u_chow/widgets/text.dart';

class ExploreDish extends StatelessWidget {
  final dish;
  final restaurant_;

  const ExploreDish({
    Key? key,
    required this.dish,
    required this.restaurant_,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final restaurant = restaurant_[0];
    return Container(
      height: AppDimensions.height120,
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
              Navigator.of(context).pushNamed(DishDetail.routeName);
            },
            child: Ink(
              child: Row(
                children: [
                  Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: AppMargin.horizontal),
                    height: AppDimensions.height100,
                    width: AppDimensions.width100,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                        color: AppColors.secondaryColor,
                        borderRadius:
                            BorderRadius.circular(AppDimensions.height16),
                        image: DecorationImage(
                          image: AssetImage(dish["image"]),
                          fit: BoxFit.cover,
                        )),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(AppDimensions.height3),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                              text: dish["name"],
                              type: 'title',
                              size: AppDimensions.height16),
                          SizedBox(
                            height: AppDimensions.height3,
                          ),
                          AppText(
                            text: restaurant["name"],
                            size: AppDimensions.height15,
                            color: AppColors.subTextColor,
                          ),
                          SizedBox(
                            height: AppDimensions.height3,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              IconAndData(
                                icon: AppIcons.clock,
                                text: restaurant["diliveryTime"],
                                textSize: AppDimensions.height14,
                              ),
                              SizedBox(
                                width: AppDimensions.width10,
                              ),
                              IconAndData(
                                icon: AppIcons.star_1,
                                text: dish["rating"],
                                iconSize: AppDimensions.height11,
                                textSize: AppDimensions.height14,
                              ),
                            ],
                          ),
                          SizedBox(height: AppDimensions.height3),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              AppText(
                                  text: "GH₵ ",
                                  type: 'title',
                                  size: AppDimensions.height14),
                              AppText(
                                  text: dish["price"][0],
                                  type: 'title',
                                  size: AppDimensions.height18)
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
              bottom: AppMargin.horizontal,
              right: AppMargin.horizontal,
              child: InkWell(
                onTap: () {},
                child: Ink(
                  child: Icon(
                    AppIcons.heart_1,
                    size: AppDimensions.height18,
                    color: AppColors.secondaryColor,
                  ),
                ),
              ))
        ]),
      ),
    );
  }
}
