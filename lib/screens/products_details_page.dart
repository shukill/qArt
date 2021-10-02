import 'package:flutter/material.dart';
import 'package:q_art/models/product.dart';

class ProductsDetailPage extends StatelessWidget {
  const ProductsDetailPage({Key? key, required this.product}) : super(key: key);
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          product.name!,
        ),
      ),
    );
  }
}
