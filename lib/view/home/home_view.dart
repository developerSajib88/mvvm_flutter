import 'package:flutter/material.dart';
import 'package:mvvm_flutter/view/cart/cart_view.dart';
import 'package:mvvm_flutter/view/comment/comment_view.dart';
import 'package:mvvm_flutter/view/product/product_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            ElevatedButton(
                onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> const ProductView())),
                child: const Text("Product Screen")
            ),


            ElevatedButton(
                onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> const CartView())),
                child: const Text("Cart Screen")
            ),


            ElevatedButton(
                onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> const CommentView())),
                child: const Text("Comment Screen")
            ),



          ],
        ),
      ),
    );
  }
}
