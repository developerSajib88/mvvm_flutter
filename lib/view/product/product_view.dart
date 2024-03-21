import 'package:flutter/material.dart';
import 'package:mvvm_flutter/configs/component/internet_exception_widget.dart';
import 'package:mvvm_flutter/configs/component/loading_widget.dart';
import 'package:mvvm_flutter/configs/dependency_injection/dependency_injection.dart';
import 'package:mvvm_flutter/data/response/status.dart';
import 'package:mvvm_flutter/view/product/widget/product_item_view.dart';
import 'package:mvvm_flutter/view_model/products/products_view_model.dart';
import 'package:provider/provider.dart';

class ProductView extends StatefulWidget {
  const ProductView({super.key});

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {

  @override
  Widget build(BuildContext context) {

    //ProductViewModel productViewModel = Provider.of<ProductViewModel>(context);


    return Scaffold(
      appBar: AppBar(
        title: const Text("Product List"),
        centerTitle: true,
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: ChangeNotifierProvider<ProductViewModel>(
          create: (BuildContext context) => ProductViewModel(productRepository: getIt())..getProductList(),
          child: Consumer<ProductViewModel>(
            builder: (BuildContext context, value, Widget? child) {
              switch (value.productList.status) {
                case Status.loading:
                  return const Center(child: LoadingWidget());
                  case Status.error:
                    return InterNetExceptionWidget(onPress: () {});
                    case Status.completed:
                      if (value.productList.data!.products!.isEmpty) {
                        return const Center(child: Text('No data found'));
                      } else {
                        return GridView.builder(
                          itemCount: value.productList.data?.products?.length,
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                childAspectRatio: 0.65
                            ),
                            itemBuilder: (context, index) {
                              return ProductItemView(
                                  id: value.productList.data?.products?[index].id ?? 0,
                                  title: value.productList.data?.products?[index].title ?? "",
                                  description: value.productList.data?.products?[index].description ?? "",
                                  price: value.productList.data?.products?[index].price ?? 0,
                                  discountPercentage: value.productList.data?.products?[index].discountPercentage ?? 0,
                                  rating: value.productList.data?.products?[index].rating ?? 0,
                                  stock: value.productList.data?.products?[index].stock ?? 0,
                                  brand: value.productList.data?.products?[index].brand ?? "",
                                  category: value.productList.data?.products?[index].category ?? "",
                                  thumbnail: value.productList.data?.products?[index].thumbnail ?? "",
                                  images: value.productList.data?.products?[index].images ?? []
                              );
                            });
                      }
                      default:
                        return Container();
              }
            }
          ),
        ),
      ),
    );
  }
}
