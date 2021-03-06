import 'package:flutter/material.dart';
import 'package:uchow/utils/colors.dart';
import 'package:uchow/utils/constants.dart';
import 'package:uchow/utils/dummydata.dart';
import 'package:uchow/widgets/dish/explore_dish.dart';

import '../widgets/text.dart';

class Favorites extends StatefulWidget {
  const Favorites({Key? key}) : super(key: key);

  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          padding: EdgeInsets.only(top: AppDimensions.height22),
          child: Column(
            children: [
              if (!ModalRoute.of(context)!.canPop)
                SizedBox(height: AppMargin.vertical),
              Row(children: [
                if (ModalRoute.of(context)!.canPop)
                  const BackButton(
                    color: AppColors.textColor,
                  )
                else
                  SizedBox(width: AppMargin.horizontal),
                AppText(text: "Favorites", size: AppDimensions.height18)
              ]),
              SizedBox(
                height: AppDimensions.height10,
              ),
              MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: dishes.length,
                    itemBuilder: (context, index) {
                      var dish = dishes[index];
                      var restaurant = restaurants
                          .where((element) => element.uid == dish.restaurantID);
                      return ExploreDish(
                        dish: dish,
                        restaurant: restaurant.single,
                      );
                    }),
              ),
            ],
          )),
    );
  }
}
