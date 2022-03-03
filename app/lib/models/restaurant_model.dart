class RestaurantModel {
  RestaurantModel(
      {required this.uid,
      required this.name,
      required this.tel,
      this.location = "",
      this.profilePicture = "",
      this.description = ""});

  int uid;
  String name;
  String tel;
  String location;
  String profilePicture;
  String description;
}
