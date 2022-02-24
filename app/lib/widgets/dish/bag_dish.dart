import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:u_chow/controllers/bag_controller.dart';
import 'package:u_chow/utils/constants.dart';

import '../../utils/colors.dart';
import '../text.dart';

class BagDish extends StatelessWidget {
  final int index;
  const BagDish({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bagController = Get.find<BagController>();

    return Obx(() => Container(
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
                    Get.toNamed("/dishdetail", arguments: {
                      "order": bagController.bag[index],
                    });
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
                              image: DecorationImage(
                                image: AssetImage(
                                    bagController.bag[index].dish.image),
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
                                text: bagController.bag[index].dish.name,
                              ),
                              SizedBox(
                                height: AppDimensions.height3,
                              ),
                              AppText(
                                type: "subtext",
                                size: AppDimensions.height14,
                                text: bagController.bag[index].selectedToppings
                                    .join(", "),
                              ),
                              SizedBox(
                                height: AppDimensions.height3,
                              ),
                              Row(
                                children: [
                                  AppText(
                                      text: "GH₵ ",
                                      size: AppDimensions.height12),
                                  AppText(
                                      text: (bagController
                                                  .bag[index].selectedPrice *
                                              bagController
                                                  .bag[index].numberToOrder)
                                          .toStringAsFixed(2),
                                      size: AppDimensions.height16)
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
                            child: AppText(
                                text: "-", size: AppDimensions.height22),
                          ),
                          onTap: () {
                            bagController.adjustNumberToOrder(index, -1);
                          }),
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
                            text: bagController.bag[index].numberToOrder
                                .toString(),
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
                            child: AppText(
                                text: "+", size: AppDimensions.height22),
                          ),
                          onTap: () {
                            bagController.adjustNumberToOrder(index, 1);
                          }),
                    ],
                  ),
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  child: InkWell(
                    onTap: () {
                      bagController.removeFromBag(index);
                    },
                    child: Ink(
                      child: Icon(Icons.close,
                          size: AppDimensions.height18,
                          color: AppColors.primaryColor),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
