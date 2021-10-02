// ignore_for_file: file_names

import 'dart:convert';
import 'brand_elements.dart';
import 'product.dart';

ProductList productListFromJson(String str) =>
    ProductList.fromJson(json.decode(str));

String productListToJson(ProductList data) => json.encode(data.toJson());

class ProductList {
  ProductList({
    required this.productCount,
    required this.products,
    required this.brands,
    required this.lastUpdatedToken,
  });

  int productCount;
  List<Product> products;
  List<BrandElement> brands;
  int lastUpdatedToken;

  factory ProductList.fromJson(Map<String, dynamic> json) => ProductList(
        productCount: json["ProductCount"],
        products: List<Product>.from(
            json["Products"].map((x) => Product.fromJson(x))),
        brands: List<BrandElement>.from(
            json["Brands"].map((x) => BrandElement.fromJson(x))),
        lastUpdatedToken: json["LastUpdatedToken"],
      );

  Map<String, dynamic> toJson() => {
        "ProductCount": productCount,
        "Products": List<dynamic>.from(products.map((x) => x.toJson())),
        "Brands": List<dynamic>.from(brands.map((x) => x.toJson())),
        "LastUpdatedToken": lastUpdatedToken,
      };
}
