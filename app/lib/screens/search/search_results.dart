import 'package:flutter/material.dart';
import 'package:u_chow/utils/colors.dart';
import 'package:u_chow/widgets/text.dart';

class SearchResults extends StatelessWidget {
  const SearchResults({Key? key}) : super(key: key);
  final searchTerm = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        title: AppText(
          text: searchTerm,
        ),
      ),
    );
  }
}
