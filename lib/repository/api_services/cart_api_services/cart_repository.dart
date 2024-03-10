
import 'package:mvvm_flutter/model/cart/cart_list_model.dart';

abstract class CartRepository {

  /// This interface method is created
  /// For get all Cart list data from server
  /// Which is implemented in Cart Http Api service class
  Future<CartListModel?> cartList();
}