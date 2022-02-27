import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:u_chow/controllers/bag_controller.dart';
import 'package:u_chow/utils/colors.dart';
import 'package:u_chow/utils/constants.dart';
import 'package:u_chow/widgets/AppTextButton.dart';
import 'package:u_chow/widgets/dish/bag_dish.dart';
import 'package:u_chow/widgets/text.dart';

class Bag extends StatelessWidget {
  const Bag({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List paymentOptions = [
      {
        "image":
            "https://www.newsghana.com.gh/wp-content/uploads/2017/05/telecom-mobile-money.jpg",
        "name": "Mobile Money",
        "available": true
      },
      {
        "image":
            "https://www.nicepng.com/png/full/87-870350_credit-cards-all-credit-card-logos.png",
        "name": "Credit Card",
        "available": true
      },
      {
        "image":
            "https://www.shareicon.net/data/2016/07/16/796809_logo_512x512.png",
        "name": "PayPal",
        "available": true
      },
    ];
    final bagController = Get.find<BagController>();
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: AppDimensions.height22),
        child: Column(children: [
          if (!ModalRoute.of(context)!.canPop)
            SizedBox(height: AppMargin.vertical),
          Row(children: [
            if (ModalRoute.of(context)!.canPop)
              const BackButton(
                color: AppColors.textColor,
              )
            else
              SizedBox(width: AppMargin.horizontal),
            AppText(text: "Bag", size: AppDimensions.height18)
          ]),
          SizedBox(
            height: AppDimensions.height10,
          ),
          Obx(
            () => bagController.bag.isNotEmpty
                ? MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: bagController.bag.length,
                        itemBuilder: (context, index) {
                          return BagDish(index: index);
                        }),
                  )
                : Container(
                    margin: EdgeInsets.only(top: logicalHeight * 0.35),
                    child: AppText(text: "Your Bag is Empty")),
          ),
          SizedBox(
            height: AppDimensions.height18,
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.bottomSheet(BottomSheet(
              onClosing: () {},
              backgroundColor: AppColors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                      top: Radius.circular(AppDimensions.height16))),
              builder: (context) {
                return Container(
                  padding: EdgeInsets.all(AppMargin.vertical),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                          text: "Check Out",
                          type: 'title',
                          size: AppDimensions.height16),
                      SizedBox(height: AppMargin.vertical),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppText(text: "Subtotal:"),
                            AppText(
                                text: bagController
                                    .calculateSubTotal()
                                    .toStringAsFixed(2)),
                          ]),
                      SizedBox(height: AppDimensions.height6),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppText(text: "Dilivery:"),
                            AppText(text: "Free"),
                          ]),
                      SizedBox(height: AppDimensions.height6),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppText(text: "Total:"),
                          AppText(
                              text: bagController
                                  .calculateSubTotal()
                                  .toStringAsFixed(2)),
                        ],
                      ),
                      SizedBox(
                        height: AppDimensions.height16,
                      ),
                      AppText(
                          text: "Pay With:",
                          type: 'title',
                          size: AppDimensions.height16),
                      SizedBox(height: AppMargin.vertical),
                      MediaQuery.removePadding(
                        context: context,
                        removeTop: true,
                        removeBottom: true,
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: paymentOptions.length,
                            itemBuilder: ((context, index) {
                              if (paymentOptions[index]["available"] == true) {
                                return AppTextButtonWithIcon(
                                  onPressed: () {},
                                  text: paymentOptions[index]["name"],
                                  image: paymentOptions[index]["image"],
                                );
                              } else {
                                return const SizedBox.shrink();
                              }
                            })),
                      )
                    ],
                  ),
                );
              },
            ));
          },
          backgroundColor: AppColors.secondaryColor,
          child: const Icon(Icons.shopping_cart_checkout_rounded),
          splashColor: AppColors.primaryColor),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
