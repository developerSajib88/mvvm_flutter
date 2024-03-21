import 'package:flutter/material.dart';

class ProductItemView extends StatelessWidget {
  final int id;
  final String title;
  final String description;
  final int price;
  final double discountPercentage;
  final double rating;
  final int stock;
  final String brand;
  final String category;
  final String thumbnail;
  final List<String> images;
  const ProductItemView({
    super.key,
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.brand,
    required this.category,
    required this.thumbnail,
    required this.images
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(8),
        child:    Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(thumbnail, width: 103, height: 100,fit: BoxFit.cover,),
            const SizedBox(height: 10,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title),
                Text("Price : $price Tk"),
              ],
            ),
          ],
        ),

      ),
    );
  }
}
