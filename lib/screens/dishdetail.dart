import 'package:flutter/material.dart';
import 'package:u_chow/utils/app_icons.dart';
import 'package:u_chow/utils/colors.dart';
import 'package:u_chow/utils/constants.dart';
import 'package:u_chow/utils/dummydata.dart';
import 'package:u_chow/widgets/iconanddata.dart';
import 'package:u_chow/widgets/text.dart';

class DishDetail extends StatefulWidget {
  const DishDetail({Key? key}) : super(key: key);

  @override
  State<DishDetail> createState() => _DishDetailState();
}

class _DishDetailState extends State<DishDetail> {
  var selectedTopings = [];
  int numberToOrder = 1;
  var dish = dishes[4];
  bool likeDish = false;

  @override
  Widget build(BuildContext context) {
    var restaurant = restaurants
        .where((element) => element["uid"] == dish["restaurantID"])
        .toList()[0];
    var topings = dish["topings"];
    var dishReviews =
        reviews.where((element) => element["dishID"] == dish["uid"]).toList();
    double averageReview =
        dishReviews.map((r) => r['stars']!).reduce((a, b) => a + b) /
            dishReviews.length;

    return Scaffold(
        backgroundColor: AppColors.white,
        body: SingleChildScrollView(
          child: Stack(children: [
            Column(
              children: [
                SizedBox(
                  height: logicalHeight * 0.4375,
                  child: Stack(
                    children: [
                      Container(
                        height: logicalHeight * 0.4,
                        decoration: BoxDecoration(
                            color: AppColors.secondaryColor,
                            borderRadius: BorderRadius.vertical(
                                bottom:
                                    Radius.circular(AppDimensions.height24)),
                            image: DecorationImage(
                              image: AssetImage(dish["image"]),
                              fit: BoxFit.cover,
                            )),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: AppDimensions.height48,
                          width: AppDimensions.width100,
                          decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(999999),
                              border: Border.all(
                                  color: AppColors.secondaryColor, width: 0.5),
                              boxShadow: [
                                BoxShadow(
                                    color: AppColors.secondaryColor
                                        .withOpacity(0.4),
                                    spreadRadius: 1,
                                    blurRadius: 6,
                                    offset: const Offset(1, 1))
                              ]),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              InkWell(
                                  child: Ink(
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          // vertical: AppDimensions.width3,
                                          horizontal: AppDimensions.height6),
                                      decoration: BoxDecoration(
                                          border: Border(
                                              right: BorderSide(
                                                  color:
                                                      AppColors.secondaryColor,
                                                  width: AppDimensions
                                                      .height0p5))),
                                      child: AppText(
                                        text: "-",
                                        size: AppDimensions.height24,
                                        color: numberToOrder <= 1
                                            ? AppColors.secondaryColor
                                            : AppColors.white,
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    setState(() {
                                      numberToOrder <= 1
                                          ? numberToOrder
                                          : numberToOrder--;
                                    });
                                  }),
                              AppText(
                                text: numberToOrder.toString(),
                                type: "title",
                                size: AppDimensions.height20,
                                color: AppColors.white,
                              ),
                              InkWell(
                                  child: Ink(
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          // vertical: AppDimensions.width3,
                                          horizontal: AppDimensions.height6),
                                      decoration: BoxDecoration(
                                          border: Border(
                                              left: BorderSide(
                                                  color:
                                                      AppColors.secondaryColor,
                                                  width: AppDimensions
                                                      .height0p5))),
                                      child: AppText(
                                        text: "+",
                                        size: AppDimensions.height24,
                                        color: numberToOrder >= 15
                                            ? AppColors.secondaryColor
                                            : AppColors.white,
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    setState(() {
                                      numberToOrder >= 15
                                          ? numberToOrder
                                          : numberToOrder++;
                                    });
                                  }),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: AppDimensions.height18),
                  color: AppColors.white,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: AppMargin.horizontal),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: logicalWidth * 0.65,
                                    child: AppText(
                                      text: dish["name"],
                                      type: "title",
                                      size: AppDimensions.height20,
                                      ignoreOverflow: true,
                                    ),
                                  ),
                                  SizedBox(height: AppDimensions.height3),
                                  SizedBox(
                                    width: logicalWidth * 0.65,
                                    child: AppText(
                                      text: restaurant["name"],
                                    ),
                                  )
                                ]),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppText(text: "Starts at:", type: "subText"),
                                Row(
                                  children: [
                                    AppText(
                                        text: "GH₵ ",
                                        type: 'title',
                                        size: AppDimensions.height12),
                                    AppText(
                                        text: dish["price"],
                                        type: 'title',
                                        size: AppDimensions.height20)
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: AppDimensions.height10,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: AppMargin.horizontal),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconAndData(
                              icon: AppIcons.star_1,
                              text: averageReview.toStringAsFixed(2),
                              iconSize: AppDimensions.height15,
                              textSize: AppDimensions.height16,
                            ),
                            IconAndData(
                              icon: AppIcons.clock,
                              text: restaurant["diliveryTime"],
                              iconSize: AppDimensions.height16,
                              textSize: AppDimensions.height16,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: AppDimensions.height24,
                      ),
                      if (topings != null)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: AppMargin.horizontal),
                              child: AppText(text: "Add Topings"),
                            ),
                            SizedBox(
                              height: AppDimensions.height100,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: topings.length,
                                  itemBuilder: (context, index) {
                                    return Center(
                                      child: Stack(children: [
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: AppMargin.horizontal),
                                          clipBehavior: Clip.antiAlias,
                                          height: AppDimensions.height80,
                                          width: AppDimensions.height80,
                                          decoration: BoxDecoration(
                                              color: AppColors.secondaryColor,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      AppDimensions.height16),
                                              border: Border.all(
                                                  color: AppColors.primaryColor,
                                                  width: 0.5),
                                              boxShadow: [
                                                BoxShadow(
                                                    color: AppColors
                                                        .secondaryColor
                                                        .withOpacity(0.14),
                                                    spreadRadius: 1,
                                                    blurRadius: 6,
                                                    offset:
                                                        const Offset(1.6, 2.6))
                                              ],
                                              image: DecorationImage(
                                                  image: findTopingsImage(
                                                      topings[index]),
                                                  fit: BoxFit.cover)),
                                        ),
                                        Positioned(
                                            top: AppDimensions.height3,
                                            right: AppDimensions.width11,
                                            child: InkWell(
                                              onTap: () {
                                                setState(() {
                                                  if (selectedTopings
                                                      .contains(index)) {
                                                    selectedTopings
                                                        .remove(index);
                                                  } else {
                                                    selectedTopings.add(index);
                                                  }
                                                });
                                              },
                                              child: Ink(
                                                child: Icon(
                                                  AppIcons.plus_circled,
                                                  color: selectedTopings
                                                          .contains(index)
                                                      ? AppColors.secondaryColor
                                                      : AppColors.subTextColor,
                                                ),
                                              ),
                                            ))
                                      ]),
                                    );
                                  }),
                            )
                          ],
                        ),
                    ],
                  ),
                ),
                SizedBox(
                  height: AppDimensions.height32,
                ),
                Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: AppMargin.horizontal),
                    child: Column(
                      children: [
                        AppText(
                          text:
                              "Reviews (" + dishReviews.length.toString() + ")",
                        ),
                        SizedBox(height: AppDimensions.height11),
                        SizedBox(
                          height: logicalHeight * 2,
                          child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: dishReviews.length,
                              itemBuilder: (context, index) {
                                var rev = dishReviews[index];
                                List<Widget> _stars = List<Widget>.filled(
                                    rev["stars"],
                                    Container(
                                        margin: EdgeInsets.only(
                                            right: AppDimensions.width3),
                                        child: Icon(
                                          AppIcons.star_1,
                                          color: AppColors.secondaryColor,
                                          size: AppDimensions.height12,
                                        )));
                                if (rev["review"] != "") {
                                  return Container(
                                    margin: EdgeInsets.only(
                                        bottom: AppDimensions.height20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            CircleAvatar(
                                              minRadius: AppDimensions.height16,
                                              maxRadius: AppDimensions.height16,
                                              backgroundImage: const AssetImage(
                                                  "assets/images/pass.jpg"),
                                              backgroundColor:
                                                  AppColors.secondaryColor,
                                            ),
                                            SizedBox(
                                              width: AppDimensions.width11,
                                            ),
                                            AppText(
                                              text: rev["name"].length > 24
                                                  ? rev["name"]
                                                          .substring(0, 21) +
                                                      "..."
                                                  : rev["name"],
                                              type: "title",
                                              size: AppDimensions.height16,
                                            ),
                                            SizedBox(
                                              width: AppDimensions.width20,
                                            ),
                                            Row(
                                              children: _stars,
                                            )
                                          ],
                                        ),
                                        SizedBox(height: AppDimensions.height3),
                                        AppText(
                                          text: rev["review"],
                                        )
                                      ],
                                    ),
                                  );
                                } else {
                                  return Container();
                                }
                              }),
                        )
                      ],
                    ))
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: AppDimensions.height32),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      child: Ink(
                        child: Container(
                          padding: EdgeInsets.all(AppDimensions.height6),
                          margin: EdgeInsets.only(left: AppMargin.horizontal),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(AppDimensions.height10),
                              color: AppColors.white,
                              border: Border.all(
                                  color: AppColors.primaryColor,
                                  width: AppDimensions.height0p5),
                              boxShadow: [
                                BoxShadow(
                                    color: AppColors.secondaryColor
                                        .withOpacity(0.4),
                                    spreadRadius: 1,
                                    blurRadius: 6,
                                    offset: const Offset(1, 1))
                              ]),
                          child: Icon(Icons.arrow_back_ios,
                              size: AppDimensions.height22,
                              color: AppColors.primaryColor),
                        ),
                      ),
                      onTap: () {},
                    ),
                    Row(
                      children: [
                        InkWell(
                          child: Ink(
                            child: Container(
                              padding: EdgeInsets.all(AppDimensions.height6),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      AppDimensions.height10),
                                  color: AppColors.white,
                                  border: Border.all(
                                      color: AppColors.primaryColor,
                                      width: AppDimensions.height0p5),
                                  boxShadow: [
                                    BoxShadow(
                                        color: AppColors.secondaryColor
                                            .withOpacity(0.4),
                                        spreadRadius: 1,
                                        blurRadius: 6,
                                        offset: const Offset(1, 1))
                                  ]),
                              child: Icon(
                                  likeDish ? AppIcons.heart : AppIcons.heart_1,
                                  size: AppDimensions.height22,
                                  color: AppColors.primaryColor),
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              likeDish = !likeDish;
                            });
                          },
                        ),
                        SizedBox(width: AppDimensions.width10),
                        InkWell(
                          child: Ink(
                            child: Container(
                              padding: EdgeInsets.all(AppDimensions.height6),
                              margin:
                                  EdgeInsets.only(right: AppMargin.horizontal),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      AppDimensions.height10),
                                  color: AppColors.white,
                                  border: Border.all(
                                      color: AppColors.primaryColor,
                                      width: AppDimensions.height0p5),
                                  boxShadow: [
                                    BoxShadow(
                                        color: AppColors.secondaryColor
                                            .withOpacity(0.4),
                                        spreadRadius: 1,
                                        blurRadius: 6,
                                        offset: const Offset(1, 1))
                                  ]),
                              child: Icon(AppIcons.bag,
                                  size: AppDimensions.height22,
                                  color: AppColors.primaryColor),
                            ),
                          ),
                          onTap: () {},
                        ),
                      ],
                    )
                  ]),
            )
          ]),
        ));
  }

  AssetImage findTopingsImage(String name) {
    switch (name) {
      case "Salad":
        return const AssetImage("assets/images/food1.png");
        break;
      case "Salad Cream":
        return const AssetImage("assets/images/food11.png");
        break;
      case "Tomato Sauce":
        return const AssetImage("assets/images/food12.png");
        break;
      default:
        return const AssetImage("assets/images/food13.png");
        break;
    }
  }

  // Widget generateStars(int num) {

  // }
}
