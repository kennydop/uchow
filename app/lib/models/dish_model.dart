class DishModel {
  DishModel({
    required this.uid,
    required this.restaurantID,
    required this.name,
    required this.price,
    this.toppings = const <String>[],
    this.rating = 0.00,
    required this.image,
    this.description = "",
    this.purchases = 0,
  });

  String uid;
  String restaurantID;
  String name;
  List<double> price;
  List<String> toppings;
  double rating;
  String image;
  String description;
  int purchases;
}
