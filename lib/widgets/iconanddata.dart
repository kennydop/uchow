import 'package:flutter/material.dart';
import 'package:u_chow/utils/colors.dart';
import 'package:u_chow/utils/constants.dart';
import 'package:u_chow/widgets/text.dart';

class IconAndData extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color? iconColor;
  final Color? textColor;
  final double? textSize;
  final double? iconSize;

  const IconAndData(
      {Key? key,
      required this.icon,
      required this.text,
      this.iconColor,
      this.textColor,
      this.textSize,
      this.iconSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: iconSize ?? AppDimensions.height12,
          color: iconColor ?? AppColors.secondaryColor,
        ),
        SizedBox(width: AppDimensions.width4),
        AppText(
          text: text,
          type: 'subtext',
          size: textSize ?? AppDimensions.height12,
          color: textColor ?? AppColors.subTextColor,
        )
      ],
    );
  }
}
