import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uchow/utils/colors.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: AppColors.textColor),
        elevation: 0.5,
        title: const TextField(
          controller: null,
          autofocus: true,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Search Foods and Resturants...',
            hintStyle: TextStyle(
              color: AppColors.subTextColor,
            ),
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.close)),
          IconButton(
              onPressed: () {
                Get.toNamed("/search/filter");
              },
              icon: const Icon(Icons.tune_rounded)),
        ],
      ),
    );
  }
}
