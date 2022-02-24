import 'package:u_chow/models/restaurant_model.dart';

import 'dish_model.dart';

class OrderInfo {
  OrderInfo({
    required this.dish,
    required this.restaurant,
    required this.numberToOrder,
    required this.selectedPrice,
    this.selectedToppings = const <String>[],
  });

  DishModel dish;
  RestaurantModel restaurant;
  int numberToOrder;
  double selectedPrice;
  List<String> selectedToppings;
}
