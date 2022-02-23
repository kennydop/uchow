import 'package:flutter/material.dart';
import 'package:u_chow/widgets/text.dart';

import '../utils/colors.dart';

class Filter extends StatelessWidget {
  const Filter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        elevation: 0.5,
        title: AppText(text: "Filter"),
        iconTheme: const IconThemeData(color: AppColors.textColor),
      ),
    );
  }
}
