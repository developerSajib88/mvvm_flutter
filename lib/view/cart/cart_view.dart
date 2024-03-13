import 'package:flutter/material.dart';
import 'package:mvvm_flutter/configs/component/internet_exception_widget.dart';
import 'package:mvvm_flutter/configs/component/loading_widget.dart';
import 'package:mvvm_flutter/configs/dependency_injection/dependency_injection.dart';
import 'package:mvvm_flutter/data/response/status.dart';
import 'package:mvvm_flutter/view_model/cart/cart_view_model.dart';
import 'package:provider/provider.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {

    //CartViewModel cartViewModel = Provider.of<CartViewModel>(context);

    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: ChangeNotifierProvider(
          create: (context)=> CartViewModel(cartRepository: getIt())..getCartList(),
          child: Consumer<CartViewModel>(
            builder: (BuildContext context, value, Widget? child) {
              switch(value.cartList.status){
                case Status.loading:
                  return const Center(child: LoadingWidget());
                case Status.error:
                  return InterNetExceptionWidget(onPress: (){});
                case Status.completed:
                  if(value.cartList.data!.carts!.isEmpty){
                    return const Center(child: Text('No data found'));
                  }else{
                    return ListView.builder(
                        itemCount: value.cartList.data?.carts?.length,
                        itemBuilder: (context, index)=>
                            Container()
                    );
                  }

                default:
                  return Container();
              }
            },
          ),
        ),
      ),
    );
  }
}
