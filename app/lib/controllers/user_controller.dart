import 'package:get/get.dart';
import 'package:uchow/models/user_model.dart';
import 'package:uchow/services/api.dart';

class UserController extends GetxController {
  UserModel user = UserModel(token: "", id: 0, name: "", email: "");
  final Api api = Api();
  RxBool loading = false.obs;

  @override
  void onInit() async {
    loading = true.obs;
    await api.getRefreshToken();
    var res = await api.refreshToken();
    if (res == null) return;
    setUser(res);
    super.onInit();
  }

  refreshToken() async {
    var res = await api.refreshToken();
    if (res == null) return;
    setUser(res);
  }

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
    Get.toNamed('/');
    loading = false.obs;
  }
}
