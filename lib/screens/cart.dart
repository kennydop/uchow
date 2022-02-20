import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:u_chow/utils/colors.dart';
import 'package:u_chow/utils/constants.dart';
import 'package:u_chow/widgets/text.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    double boxHeight = logicalHeight - (AppMargin.vertical * 2);
    double boxWidth = logicalWidth - (AppMargin.horizontal * 2);
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: EdgeInsets.only(
                left: AppMargin.horizontal, top: AppMargin.vertical),
            child: Row(children: [
              InkWell(
                child: Ink(
                    padding: EdgeInsets.all(AppDimensions.height6),
                    child: const Icon(Icons.arrow_back,
                        color: AppColors.textColor)),
                onTap: () {},
              ),
              SizedBox(
                width: AppDimensions.height12,
              ),
              AppText(text: "Bag", size: AppDimensions.height22)
            ]),
          ),
          SizedBox(
            height: AppDimensions.height16,
          ),
          Container(
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
                  Row(
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
                              image:
                                  AssetImage("assets/images/fried_rice.jfif"),
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
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Row(
                      children: [
                        InkWell(
                            child: Ink(
                              padding: EdgeInsets.symmetric(
                                  horizontal: AppDimensions.width8),
                              child: AppText(
                                  text: "-", size: AppDimensions.height22),
                            ),
                            onTap: () {}),
                        SizedBox(
                          width: AppDimensions.width4,
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
                          width: AppDimensions.width4,
                        ),
                        InkWell(
                            child: Ink(
                              padding: EdgeInsets.symmetric(
                                  horizontal: AppDimensions.width8),
                              child: AppText(
                                  text: "+", size: AppDimensions.height22),
                            ),
                            onTap: () {}),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ]),
      )),
    );
  }
}
