class DishModel {
  DishModel({
    required this.uid,
    required this.restaurantID,
    required this.name,
    required this.price,
    this.toppings = const <String>[],
    required this.image,
    this.description = "",
    this.purchases = 0,
  });

  int uid;
  int restaurantID;
  String name;
  List<double> price;
  List<String> toppings;
  String image;
  String description;
  int purchases;
}
