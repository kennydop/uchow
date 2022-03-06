class UserModel {
  UserModel(
      {required this.id,
      required this.name,
      this.image = "",
      required this.college,
      this.diliveryAddress = ""});

  int id;
  String name;
  String? image;
  String college;
  String? diliveryAddress;
}
