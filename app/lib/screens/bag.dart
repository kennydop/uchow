import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:u_chow/controllers/bag_controller.dart';
import 'package:u_chow/utils/colors.dart';
import 'package:u_chow/utils/constants.dart';
import 'package:u_chow/widgets/dish/bag_dish.dart';
import 'package:u_chow/widgets/text.dart';

class Bag extends StatelessWidget {
  const Bag({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bagController = Get.find<BagController>();
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
          )
        ]),
      ),
    );
  }
}
