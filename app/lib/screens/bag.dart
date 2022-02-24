import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:u_chow/controllers/bagController.dart';
import 'package:u_chow/utils/colors.dart';
import 'package:u_chow/utils/constants.dart';
import 'package:u_chow/widgets/dish/bag_dish.dart';
import 'package:u_chow/widgets/text.dart';

class Bag extends StatelessWidget {
  const Bag({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BagController bagController = Get.put(BagController());
    return Scaffold(
      backgroundColor: AppColors.bgColor,
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
            () => ListView.builder(
                itemCount: bagController.bag.length,
                itemBuilder: (context, index) {
                  return BagDish(orderInfo: bagController.bag[index]);
                }),
          )
        ]),
      ),
    );
  }
}
