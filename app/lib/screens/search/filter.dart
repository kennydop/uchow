import 'package:flutter/material.dart';
import 'package:uchow/utils/colors.dart';
import 'package:uchow/widgets/text.dart';

class Filter extends StatelessWidget {
  const Filter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: Colors.white,
        title: AppText(text: "Filter"),
        iconTheme: const IconThemeData(color: AppColors.textColor),
      ),
    );
  }
}
