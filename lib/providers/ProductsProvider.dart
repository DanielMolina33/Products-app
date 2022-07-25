// Flutter
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/ProductModel.dart';

// Utilities
import '../utils/Api.dart';
import '../utils/ApiMessages.dart';

class ProductsProvider extends ChangeNotifier {
  String path = '/product';
  
  Future<List<ProductData>?> getProducts(String query, token, context) async {
    final res = await Api.httpGet(path, token);
    Map<String, dynamic> productsData = jsonDecode(res.body);

    if(res.statusCode == 200){
      final products = ProductModel.fromJson(productsData);
      return products.data!.data;

    } else if(res.statusCode == 400){
      final apiMessages = ApiMessages();
      apiMessages.getMessages(productsData, context);
    }

    return null;
  }
}