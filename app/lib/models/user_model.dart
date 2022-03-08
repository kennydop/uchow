class UserModel {
  UserModel(
      {required this.token,
      required this.id,
      required this.name,
      required this.email,
      this.image = "",
      this.tel = "",
      this.diliveryAddress = ""});

  String token, name, email, tel;
  int id;
  String? image;
  String? diliveryAddress;
}
