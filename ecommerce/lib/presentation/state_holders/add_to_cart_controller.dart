import 'package:ecommerce/data/models/network_response.dart';
import 'package:ecommerce/data/services/network_caller.dart';
import 'package:get/get.dart';

import '../../data/utils/utils.dart';

class AddToCartController extends GetxController {
  bool _addToCartInProgress = false;
  String _message = '';

  bool get addToCartInProgress => _addToCartInProgress;

  String get message => _message;

  Future<bool> addToCart(int productId, String color, String size) async {
    _addToCartInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.postRequest(Urls.addToCart, {
      "product_id": productId,
      "color": color,
      "size": size
    });
    _addToCartInProgress = false;
    update();
    if (response.isSuccess) {
      return true;
    } else {
      _message = 'Add to cart failed! Try again';
      return false;
    }
  }
}