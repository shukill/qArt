// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:q_art/core/constants.dart';
import 'package:q_art/models/news_list.dart';
import 'package:q_art/models/product.dart';
import 'package:q_art/models/product_list_model.dart';

class RemoteApi {
  List<Product> myProducts = [];
  List<Hotnew> myArticles = [];

  Future<List<Product>?> getProductList() async {
    try {
      var response = await Dio().get(AppConstants.getProdutsListWithSizes);
      if (response.statusCode == 200) {
        var data = response.data;
        myProducts = ProductList.fromJson(data).products;
        return myProducts;
      }
    } catch (e) {
      print(e);
      Fluttertoast.showToast(msg: '$e');
    }
  }

  Future<List<Hotnew>?> getArticlesList() async {
    try {
      var response = await Dio().get(AppConstants.getNewsArticlesUrl);
      if (response.statusCode == 200) {
        var data = jsonEncode(response.data);
        var mydata = articleListFromJson(data);
        myArticles = mydata[0].videodetail;
        return myArticles;
      }
    } catch (e) {
      print(e);
      Fluttertoast.showToast(msg: '$e');
    }
  }
}
