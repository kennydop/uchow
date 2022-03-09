import 'package:get/get.dart';
import 'package:uchow/controllers/user_controller.dart';
import 'package:uchow/helpers/api.dart';
import 'package:uchow/interfaces/interfaces.dart';

class EmailAuth {
  static EmailAuth _instance = EmailAuth._internal();
  EmailAuth._internal() {
    _instance = this;
  }
  factory EmailAuth() => _instance;

  final Api api = Api();
  final UserController userController = Get.find<UserController>();

  Future<LocalResponse> signUp(
      String name, String email, String password) async {
    var res = await api.post("http://192.168.43.108:5000/api/auth/signup",
        body: {"name": name, "email": email, "password": password});
    if (res["success"] == null) {
      userController.setUser(res);
      return LocalResponse(success: true);
    } else {
      return LocalResponse(success: false, message: res["message"]);
    }
  }

  Future<LocalResponse> signIn(String email, String password) async {
    var res = await api.post("http://192.168.43.108:5000/api/auth/signin",
        body: {"email": email, "password": password});
    if (res["success"] == null) {
      userController.setUser(res);
      return LocalResponse(success: true);
    } else {
      return LocalResponse(success: false, message: res["message"]);
    }
  }
}
