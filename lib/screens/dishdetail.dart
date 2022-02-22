import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:u_chow/screens/bag.dart';
import 'package:u_chow/utils/app_icons.dart';
import 'package:u_chow/utils/colors.dart';
import 'package:u_chow/utils/constants.dart';
import 'package:u_chow/utils/dummydata.dart';
import 'package:u_chow/widgets/iconanddata.dart';
import 'package:u_chow/widgets/text.dart';

class DishDetail extends StatefulWidget {
  const DishDetail({Key? key}) : super(key: key);
  static const routeName = "/dishdetail";

  @override
  State<DishDetail> createState() => _DishDetailState();
}

class _DishDetailState extends State<DishDetail> {
  var selectedTopings = [];
  int numberToOrder = 1;
  var dish = dishes[4];
  bool likeDish = false;
  bool addedToCart = false;
  var selectedPrice;

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
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              child: Container(
                width: double.maxFinite,
                height: logicalHeight * 0.45,
                decoration: BoxDecoration(
                    color: AppColors.secondaryColor,
                    image: DecorationImage(
                      image: AssetImage(dish["image"]),
                      fit: BoxFit.cover,
                    )),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: (logicalHeight * .45) - AppDimensions.height18),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: AppDimensions.height18),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(AppDimensions.height16),
                            topRight: Radius.circular(AppDimensions.height16)),
                        color: AppColors.white),
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
                                      width: logicalWidth * 0.68,
                                      child: AppText(
                                        text: dish["name"],
                                        type: "title",
                                        size: AppDimensions.height20,
                                        ignoreOverflow: true,
                                      ),
                                    ),
                                    SizedBox(height: AppDimensions.height3),
                                    SizedBox(
                                      width: logicalWidth * 0.68,
                                      child: AppText(
                                        text: restaurant["name"],
                                      ),
                                    )
                                  ]),
                              Row(
                                children: [
                                  InkWell(
                                      child: Ink(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: AppDimensions.width8),
                                        child: AppText(
                                            text: "-",
                                            size: AppDimensions.height22),
                                      ),
                                      onTap: () {
                                        setState(() {
                                          if (addedToCart) {
                                            addedToCart = false;
                                          }
                                          if (selectedPrice != null) {
                                            selectedPrice = null;
                                          }
                                          numberToOrder <= 1
                                              ? numberToOrder
                                              : numberToOrder--;
                                        });
                                      }),
                                  SizedBox(
                                    width: AppDimensions.width4,
                                  ),
                                  Container(
                                    height: AppDimensions.height28,
                                    width: AppDimensions.height28,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          AppDimensions.height3),
                                      border: Border.all(
                                          color: AppColors.primaryColor),
                                    ),
                                    child: Center(
                                      child: AppText(
                                        text: numberToOrder.toString(),
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
                                            text: "+",
                                            size: AppDimensions.height22),
                                      ),
                                      onTap: () {
                                        setState(() {
                                          if (addedToCart) {
                                            addedToCart = false;
                                          }
                                          if (selectedPrice != null) {
                                            selectedPrice = null;
                                          }
                                          numberToOrder >= 15
                                              ? numberToOrder
                                              : numberToOrder++;
                                        });
                                      }),
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
                        if (addedToCart)
                          Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: AppDimensions.height16),
                              margin: EdgeInsets.only(
                                  bottom: AppDimensions.height24),
                              child: AppText(text: "Added To Cart")),
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
                                                horizontal:
                                                    AppMargin.horizontal),
                                            clipBehavior: Clip.antiAlias,
                                            height: AppDimensions.height80,
                                            width: AppDimensions.height80,
                                            decoration: BoxDecoration(
                                                color: AppColors.secondaryColor,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        AppDimensions.height16),
                                                border: Border.all(
                                                    color:
                                                        AppColors.primaryColor,
                                                    width: 0.5),
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: AppColors
                                                          .secondaryColor
                                                          .withOpacity(0.14),
                                                      spreadRadius: 1,
                                                      blurRadius: 6,
                                                      offset: const Offset(
                                                          1.6, 2.6))
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
                                                      selectedTopings
                                                          .add(index);
                                                    }
                                                  });
                                                },
                                                child: Ink(
                                                  child: Icon(
                                                    AppIcons.plus_circled,
                                                    color: selectedTopings
                                                            .contains(index)
                                                        ? AppColors
                                                            .secondaryColor
                                                        : AppColors
                                                            .subTextColor,
                                                  ),
                                                ),
                                              ))
                                        ]),
                                      );
                                    }),
                              )
                            ],
                          ),
                        SizedBox(
                          height: AppDimensions.height24,
                        ),
                        if (!addedToCart)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: AppMargin.horizontal),
                                child: AppText(text: "Select Price"),
                              ),
                              SizedBox(
                                height: AppDimensions.height10,
                              ),
                              MediaQuery.removePadding(
                                context: context,
                                removeTop: true,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: dish["price"].length,
                                  itemBuilder: (context, index) {
                                    var price = dish["price"][index];
                                    return InkWell(
                                      child: Ink(
                                        child: Container(
                                            padding: EdgeInsets.only(
                                                left: AppDimensions.width16),
                                            margin: EdgeInsets.only(
                                                left: AppMargin.horizontal,
                                                right: AppMargin.horizontal,
                                                bottom: AppMargin.vertical),
                                            height: AppDimensions.height48,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        AppDimensions.height10),
                                                border: Border.all(
                                                    width:
                                                        AppDimensions.height1p2,
                                                    color: selectedPrice ==
                                                            price
                                                        ? AppColors
                                                            .secondaryColor
                                                        : AppColors
                                                            .subTextColor)),
                                            child: Row(
                                              children: [
                                                AppText(
                                                  text: "GH₵ ",
                                                  type: 'title',
                                                  size: AppDimensions.height16,
                                                  color: selectedPrice == price
                                                      ? AppColors.primaryColor
                                                      : AppColors.textColor,
                                                ),
                                                AppText(
                                                  text: price,
                                                  type: 'title',
                                                  size: AppDimensions.height20,
                                                  color: selectedPrice == price
                                                      ? AppColors.primaryColor
                                                      : AppColors.textColor,
                                                )
                                              ],
                                            )),
                                      ),
                                      onTap: () {
                                        setState(() {
                                          selectedPrice = price;
                                        });
                                      },
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: AppDimensions.height32,
                  ),
                  Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppMargin.horizontal),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            text: "Reviews (" +
                                dishReviews.length.toString() +
                                ")",
                          ),
                          SizedBox(height: AppDimensions.height10),
                          MediaQuery.removePadding(
                            context: context,
                            removeTop: true,
                            child: ListView.builder(
                                shrinkWrap: true,
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
                                                minRadius:
                                                    AppDimensions.height16,
                                                maxRadius:
                                                    AppDimensions.height16,
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
                                          SizedBox(
                                              height: AppDimensions.height3),
                                          AppText(
                                            text: rev["review"],
                                            ignoreOverflow: true,
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
            ),
            Positioned(
              left: AppMargin.horizontal,
              right: AppMargin.horizontal,
              top: AppMargin.vertical,
              child: SafeArea(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        child: Ink(
                          child: Container(
                            width: AppDimensions.height38,
                            height: AppDimensions.height38,
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
                                          .withOpacity(0.1),
                                      spreadRadius: 2,
                                      blurRadius: 8,
                                      offset: const Offset(2, 3))
                                ]),
                            child: Icon(
                                Platform.isAndroid
                                    ? Icons.arrow_back
                                    : Icons.arrow_back_ios_new,
                                size: AppDimensions.height22,
                                color: AppColors.primaryColor),
                          ),
                        ),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      InkWell(
                        child: Ink(
                          child: Container(
                            width: AppDimensions.height38,
                            height: AppDimensions.height38,
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
                                          .withOpacity(0.1),
                                      spreadRadius: 2,
                                      blurRadius: 8,
                                      offset: const Offset(2, 3))
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
                    ]),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: selectedPrice == null
          ? const SizedBox.shrink()
          : FloatingActionButton(
              onPressed: () {
                if (!addedToCart) {
                  setState(() {
                    addedToCart = true;
                    selectedTopings = [];
                  });
                } else {
                  Navigator.of(context).pushNamed(Cart.routeName);
                }
              },
              child: Icon(addedToCart ? AppIcons.bag : Icons.add),
              backgroundColor: addedToCart
                  ? AppColors.secondaryColor
                  : AppColors.primaryColor,
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
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
