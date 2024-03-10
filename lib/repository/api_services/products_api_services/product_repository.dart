import 'package:mvvm_flutter/model/products/product_list_model.dart';

abstract class ProductRepository {

  /// This interface method is created
  /// For get all Product list data from server
  /// Which is implemented in Product Http Api service class
  Future<ProductListModel?> productList();
}