import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm_flutter/data/response/api_response.dart';
import 'package:mvvm_flutter/model/products/product_list_model.dart';
import 'package:mvvm_flutter/repository/api_services/products_api_services/product_repository.dart';

class ProductViewModel extends ChangeNotifier {
  final ProductRepository productRepository;
  ProductViewModel({required this.productRepository});

  ApiResponse<ProductListModel?> productList = ApiResponse.loading();

  /// This method I was created for Product List state update
  void setProductList(ApiResponse<ProductListModel> response){
    productList = response;
    notifyListeners();
  }

  /// This function is called
  /// For fetching product from server
  Future<void> getProductList () async {
    setProductList(ApiResponse.loading());

    productRepository.productList().then((value) {
      if(value != null){
        setProductList(ApiResponse.completed(value));
      }
    }).onError((error, stackTrace) {

      if (kDebugMode) {
        print(error);
        print(stackTrace);
      }
      setProductList(ApiResponse.error(error.toString()));
    });

  }

}