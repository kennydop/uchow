import 'dart:ffi';

class DishModel {
  DishModel({
    required this.uid,
    required this.dishID,
    required this.restaurantID,
    required this.name,
    required this.price,
    this.rating = 0.00,
    required this.image,
    this.purchases = 0,
  });

  var uid;
  var dishID;
  var restaurantID;
  String name;
  Array price;
  double rating;
  String image;
  int purchases;
}
