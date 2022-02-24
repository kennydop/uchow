import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:u_chow/utils/constants.dart';

import '../../utils/colors.dart';
import '../text.dart';

class BagDish extends StatefulWidget {
  final orderInfo;
  const BagDish({Key? key, required this.orderInfo}) : super(key: key);

  @override
  _BagDishState createState() => _BagDishState();
}

class _BagDishState extends State<BagDish> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppDimensions.height100,
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
        padding: EdgeInsets.all(AppMargin.horizontal),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppDimensions.height16),
        ),
        child: Stack(
          children: [
            InkWell(
              onTap: () {
                Get.toNamed("/dishdetail");
              },
              child: Ink(
                child: Row(
                  children: [
                    Container(
                      width: AppDimensions.height80,
                      height: AppDimensions.height80,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                          color: AppColors.secondaryColor,
                          borderRadius:
                              BorderRadius.circular(AppDimensions.height16),
                          image: const DecorationImage(
                            image: AssetImage("assets/images/fried_rice.jfif"),
                            fit: BoxFit.cover,
                          )),
                    ),
                    SizedBox(
                      width: AppDimensions.width16,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            text: "Fried Rice with Chicken",
                          ),
                          SizedBox(
                            height: AppDimensions.height3,
                          ),
                          AppText(
                            type: "subtext",
                            size: AppDimensions.height14,
                            text: "Salad, Mayoneese, Tomato Sauce, Spaghetti",
                          ),
                          SizedBox(
                            height: AppDimensions.height3,
                          ),
                          Row(
                            children: [
                              AppText(
                                  text: "GH₵ ", size: AppDimensions.height12),
                              AppText(
                                  text: "16.00", size: AppDimensions.height16)
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: Row(
                children: [
                  InkWell(
                      child: Ink(
                        padding: EdgeInsets.symmetric(
                            horizontal: AppDimensions.width8),
                        child: AppText(text: "-", size: AppDimensions.height22),
                      ),
                      onTap: () {}),
                  SizedBox(
                    width: AppDimensions.width3,
                  ),
                  Container(
                    height: AppDimensions.height24,
                    width: AppDimensions.height24,
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(AppDimensions.height3),
                      border: Border.all(color: AppColors.primaryColor),
                    ),
                    child: Center(
                      child: AppText(
                        text: "6",
                      ),
                    ),
                  ),
                  SizedBox(
                    width: AppDimensions.width3,
                  ),
                  InkWell(
                      child: Ink(
                        padding: EdgeInsets.symmetric(
                            horizontal: AppDimensions.width8),
                        child: AppText(text: "+", size: AppDimensions.height22),
                      ),
                      onTap: () {}),
                ],
              ),
            ),
            Positioned(
              right: 0,
              top: 0,
              child: InkWell(
                onTap: () {},
                child: Ink(
                  child: Icon(Icons.close,
                      size: AppDimensions.height20,
                      color: AppColors.primaryColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
