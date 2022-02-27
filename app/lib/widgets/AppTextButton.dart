import 'package:flutter/material.dart';
import 'package:u_chow/utils/colors.dart';
import 'package:u_chow/utils/constants.dart';
import 'package:u_chow/widgets/text.dart';

class AppTextButton extends StatelessWidget {
  String text;
  Function() onPressed;
  Color? color;
  AppTextButton(
      {required this.text,
      required this.onPressed,
      this.color = AppColors.primaryColor,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: AppText(
          text: text,
          color: AppColors.white,
        ),
        style: TextButton.styleFrom(
          backgroundColor: color,
          minimumSize: Size(logicalWidth - (AppMargin.horizontal * 2),
              AppDimensions.height45),
        ));
  }
}

class AppTextButtonWithIcon extends StatelessWidget {
  String text;
  Function() onPressed;
  Color? color;
  Icon? icon;
  String? image;
  AppTextButtonWithIcon(
      {required this.onPressed,
      required this.text,
      this.image,
      this.icon,
      this.color = AppColors.primaryColor,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            image != null
                ? Image.network(image.toString(),
                    height: AppDimensions.height28, fit: BoxFit.contain)
                : icon != null
                    ? icon as Widget
                    : SizedBox.shrink(),
            SizedBox(
              width: AppMargin.horizontal,
            ),
            AppText(
              text: text,
              color: AppColors.white,
            ),
          ],
        ),
        style: TextButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          minimumSize: Size(logicalWidth - (AppMargin.horizontal * 2),
              AppDimensions.height45),
        ));
  }
}
