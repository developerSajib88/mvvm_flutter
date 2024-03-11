import 'package:flutter/foundation.dart';
import 'package:mvvm_flutter/data/response/api_response.dart';
import 'package:mvvm_flutter/model/cart/cart_list_model.dart';
import 'package:mvvm_flutter/repository/api_services/cart_api_services/cart_repository.dart';

class CartViewModel extends ChangeNotifier {
  final CartRepository cartRepository;
  CartViewModel({required this.cartRepository});

  ApiResponse<CartListModel> cartList = ApiResponse.loading();

  /// This method I was created for Cart List state update
  void setCartList (ApiResponse<CartListModel> response){
    cartList = response;
  }

  /// This function is called
  /// For fetching Cart List from server
  Future<void> getCartList ()async{
    setCartList(ApiResponse.loading());
    cartRepository.cartList().then((value) {
      if(value != null){
        setCartList(ApiResponse.completed(value));
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error);
        print(stackTrace);
      }
      setCartList(ApiResponse.error(error.toString()));
    });
  }

}