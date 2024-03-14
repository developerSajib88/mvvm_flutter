import 'package:mvvm_flutter/configs/api_url/api_urls.dart';
import 'package:mvvm_flutter/data/network/base_http_methods.dart';
import 'package:mvvm_flutter/data/network/network_http_methods.dart';
import 'package:mvvm_flutter/model/products/product_list_model.dart';
import 'package:mvvm_flutter/repository/api_services/products_api_services/product_repository.dart';

class ProductHttpApiService implements ProductRepository{


  /// BaseHttpMethods is Api methods domain Interface
  /// And NetworkHttpMethods is Api methods infrastructure
  final BaseHttpMethods _apiMethods = NetworkHttpMethods();

  /// This is product API service method
  @override
  Future<ProductListModel?> productList() async {
    Map<String,dynamic>? response = await _apiMethods.get(ApiUrls.product);
    if(response != null){
      ProductListModel productListModel = ProductListModel.fromJson(response);
      return productListModel;
    }else{
      return null;
    }
  }

}