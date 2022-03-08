import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:uchow/models/user_model.dart';
import 'package:uchow/api_calls/google_auth.dart';

class UserController extends GetxController {
  UserModel user = UserModel(token: "", id: 0, name: "", email: "");

  void setUser(res) {
    user = UserModel(
      token: res["token"],
      id: res["id"],
      name: res["name"],
      email: res["email"],
      tel: res["tel"] ?? "",
      image: res["image"] ?? "",
      diliveryAddress: res["dilivery_address"] ?? "",
    );
    update();
  }
}
