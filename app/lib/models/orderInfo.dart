import 'dishModel.dart';

class OrderInfo {
  OrderInfo({
    required this.dish,
    required this.numToOrder,
    this.toppings = const [],
  });

  DishModel dish;
  int numToOrder;
  List<String> toppings;
}
