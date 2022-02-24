import 'package:get/get.dart';
import 'package:u_chow/models/orderInfo.dart';

class BagController extends GetxController {
  RxList<OrderInfo> bag = <OrderInfo>[].obs;

  addToBag(OrderInfo order) {
    bag.add(order);
  }

  removeFromBag(int index) {
    bag.removeAt(index);
  }
}
