import 'package:get/get.dart';

class QuantityController extends GetxController {
  // Reactive variable to track the quantity
  var quantity = 1.obs;

  // Method to increment the quantity
  void increment() {
    quantity.value++;
  }

  // Method to decrement the quantity
  void decrement() {
    if (quantity.value > 1) {
      quantity.value--;
    }
  }
}
