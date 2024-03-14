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
    return Container(
      width: double.infinity,
      height: 150,
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Column(
            children: [
              Image.network(thumbnail, width: 100, height: 100,),
              Text(price.toString())
            ],
          ),
          
          const SizedBox(width: 10),
          
          Column(
            children: [
              
              
              
            ],
          )
          
        ],
      ),
    );
  }
}
