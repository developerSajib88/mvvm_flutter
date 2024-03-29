import 'package:mvvm_flutter/configs/api_url/api_urls.dart';
import 'package:mvvm_flutter/data/network/base_http_methods.dart';
import 'package:mvvm_flutter/data/network/network_http_methods.dart';
import 'package:mvvm_flutter/model/cart/cart_list_model.dart';
import 'package:mvvm_flutter/repository/api_services/cart_api_services/cart_repository.dart';

class CartHttpApiService extends CartRepository{

  /// BaseHttpMethods is Api methods domain Interface
  /// And NetworkHttpMethods is Api methods infrastructure
  final BaseHttpMethods _apiMethods = NetworkHttpMethods();

  /// This is cart API service method
  @override
  Future<CartListModel?> cartList() async {
    Map<String,dynamic>? response = await _apiMethods.get(ApiUrls.cart);
    if(response != null){
      CartListModel cartListModel = CartListModel.fromJson(response);
      return cartListModel;
    }else{
      return null;
    }
  }

}