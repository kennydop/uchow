import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:u_chow/models/dish_model.dart';
import 'package:u_chow/models/order_info.dart';
import 'package:u_chow/models/restaurant_model.dart';

class BagController extends GetxController {
  RxList<OrderInfo> bag = <OrderInfo>[].obs;
  final savedBag = GetStorage();

  @override
  onInit() {
    super.onInit();
    // savedBag.erase();
    if (savedBag.read('bag') != null) {
      bag = _toRxList(savedBag.read('bag'));
    }
  }

  addToBag(OrderInfo order) {
    bag.add(order);
    savedBag.write('bag', _toJson());
  }

  removeFromBag(int index) {
    bag.removeAt(index);
    savedBag.write('bag', _toJson());
  }

  adjustNumberToOrder(int index, int number) {
    if (bag[index].numberToOrder <= 1 && number <= 0 ||
        bag[index].numberToOrder >= 15 && number >= 1) return;
    bag[index].numberToOrder += number;
    savedBag.write('bag', _toJson());
    bag.refresh();
  }

  alreadyInBag(int uid, int numberToOrder, double selectedPrice,
      List<String> selectedToppings) {
    return bag.indexWhere((element) =>
            element.dish.uid == uid &&
            element.numberToOrder == numberToOrder &&
            element.selectedPrice == selectedPrice &&
            selectedToppings
                .every((e) => element.selectedToppings.contains(e))) >
        -1;
  }

  double calculateSubTotal() {
    double total = 0.00;
    bag.forEach((element) {
      total += (element.selectedPrice * element.numberToOrder);
    });
    return total;
  }

  _toJson() {
    List jsonObj = [];
    bag.forEach((element) {
      jsonObj.add(toJSON(element));
    });
    return jsonObj;
  }

  _toRxList(List json) {
    RxList _bag = <OrderInfo>[].obs;
    json.forEach((element) {
      _bag.add(toRxList(element));
    });
    return _bag;
  }

  toJSON(OrderInfo order) {
    return {
      "dish": {
        "uid": order.dish.uid,
        "restaurantID": order.dish.restaurantID,
        "name": order.dish.name,
        "price": order.dish.price,
        "toppings": order.dish.toppings,
        "image": order.dish.image,
        "description": order.dish.description,
        "purchases": order.dish.purchases,
      },
      "restaurant": {
        "uid": order.restaurant.uid,
        "name": order.restaurant.name,
        "tel": order.restaurant.tel,
        "location": order.restaurant.location,
        "profilePicture": order.restaurant.profilePicture,
      },
      "numberToOrder": order.numberToOrder,
      "selectedPrice": order.selectedPrice,
      "selectedToppings": order.selectedToppings,
    };
  }

  toRxList(Map order) {
    return OrderInfo(
        dish: DishModel(
          uid: order["dish"]["uid"],
          restaurantID: order["dish"]["restaurantID"],
          name: order["dish"]["name"],
          price: order["dish"]["price"].cast<double>(),
          image: order["dish"]["image"],
          description: order["dish"]["description"],
          purchases: order["dish"]["purchases"],
          toppings: order["dish"]["toppings"].cast<String>(),
        ),
        restaurant: RestaurantModel(
            uid: order["dish"]["uid"],
            name: order["restaurant"]["name"],
            tel: order["restaurant"]["tel"],
            location: order["restaurant"]["location"],
            profilePicture: order["restaurant"]["profilePicture"]),
        numberToOrder: order["numberToOrder"],
        selectedPrice: order["selectedPrice"],
        selectedToppings: order["selectedToppings"].cast<String>());
  }
}
