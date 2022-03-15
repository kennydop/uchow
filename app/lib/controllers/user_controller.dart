import 'dart:async';
import 'package:get/get.dart';
import 'package:uchow/models/user_model.dart';
import 'package:uchow/services/api.dart';

class UserController extends GetxController {
  UserModel user = UserModel(token: "", id: 0, name: "", email: "");
  final Api api = Api();
  RxBool loading = false.obs;
  bool inApp = false;
  Timer? timer;

  @override
  void onInit() async {
    loading = true.obs;
    await api.getRefreshToken();
    await refreshToken();
    timer = Timer.periodic(
        const Duration(minutes: 20), (Timer t) async => await refreshToken());
    super.onInit();
  }

  @override
  void onClose() {
    timer?.cancel();
    super.dispose();
  }

  refreshToken() async {
    var res = await api.refreshToken();
    if (res == null) return;
    setUser(res);
    if (inApp == true) return;
    Get.toNamed('/');
    inApp == true;
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
    loading = false.obs;
  }
}
