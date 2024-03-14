
import 'package:get_it/get_it.dart';
import 'package:mvvm_flutter/repository/api_services/cart_api_services/cart_http_api_service.dart';
import 'package:mvvm_flutter/repository/api_services/cart_api_services/cart_repository.dart';
import 'package:mvvm_flutter/repository/api_services/products_api_services/product_http_api_service.dart';
import 'package:mvvm_flutter/repository/api_services/products_api_services/product_repository.dart';
import 'package:mvvm_flutter/repository/api_services/user_api_services/comments_http_api_service.dart';
import 'package:mvvm_flutter/repository/api_services/user_api_services/comments_repository.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  getIt.registerLazySingleton<ProductRepository>(() => ProductHttpApiService());
  getIt.registerLazySingleton<CartRepository>(() => CartHttpApiService());
  getIt.registerLazySingleton<CommentRepository>(() => CommentHttpApiService());
}