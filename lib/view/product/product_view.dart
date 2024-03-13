import 'package:flutter/material.dart';
import 'package:mvvm_flutter/configs/component/internet_exception_widget.dart';
import 'package:mvvm_flutter/configs/component/loading_widget.dart';
import 'package:mvvm_flutter/configs/dependency_injection/dependency_injection.dart';
import 'package:mvvm_flutter/data/response/status.dart';
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
                        return ListView.builder(
                            itemBuilder: (context, index) {
                              return Container();
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
