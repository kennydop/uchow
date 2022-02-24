import 'package:get/get.dart';
import 'package:u_chow/models/order_info.dart';

class BagController extends GetxController {
  RxList<OrderInfo> bag = <OrderInfo>[].obs;

  addToBag(OrderInfo order) {
    bag.add(order);
  }

  removeFromBag(int index) {
    bag.removeAt(index);
  }

  adjustNumberToOrder(int index, int number) {
    if (bag[index].numberToOrder <= 1 && number <= 0 ||
        bag[index].numberToOrder >= 15 && number >= 1) return;
    bag[index].numberToOrder += number;
    bag.refresh();
  }

  alreadyInBag(String uid, int numberToOrder, double selectedPrice,
      List<String> selectedToppings) {
    return bag.indexWhere((element) =>
            element.dish.uid == uid &&
            element.numberToOrder == numberToOrder &&
            element.selectedPrice == selectedPrice &&
            selectedToppings
                .every((e) => element.selectedToppings.contains(e))) >
        -1;
  }
}
