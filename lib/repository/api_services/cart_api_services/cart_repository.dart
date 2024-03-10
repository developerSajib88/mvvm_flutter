
import 'package:mvvm_flutter/model/cart/cart_list_model.dart';

abstract class CartRepository {
  /// This interface method is created
  /// For get all cart list data from server
  Future<CartListModel?> getCartList();
}