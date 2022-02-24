class RestaurantModel {
  RestaurantModel(
      {required this.uid,
      required this.name,
      this.diliveryTime = "30 mins",
      this.numberOfDishes = 0,
      required this.tel,
      this.location = "",
      this.profilePicture = ""});

  var uid;
  String name;
  String diliveryTime;
  int numberOfDishes;
  String tel;
  String location;
  String profilePicture;
}
