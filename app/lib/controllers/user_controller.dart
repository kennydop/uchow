import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:uchow/models/user_model.dart';
import 'package:uchow/api_calls/auth.dart';

class UserController extends GetxController {
  UserModel user = UserModel(id: 0, name: "", college: "");

  @override
  void onInit() {
    GoogleAuth().listenForUser();
    super.onInit();
  }

  void login(int id, String name, String college, String? diliveryAddress,
      String? image) {
    user = UserModel(
        id: id,
        name: name,
        college: college,
        image: image,
        diliveryAddress: diliveryAddress);
    update();
  }
}
