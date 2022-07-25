// Flutter
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/LoginModel.dart';
import 'package:localstorage/localstorage.dart';

// Utilities
import '../utils/Api.dart';
import '../utils/ApiMessages.dart';

class LoginProvider extends ChangeNotifier {
  LocalStorage storage = LocalStorage("session");
  String path = '/signin/customers';
  
  void signin(Map<String, String> data, context) async {
    final res = await Api.httpPost(path, data);
    Map<String, dynamic> userMap = jsonDecode(res.body);

    if(res.statusCode == 200){
      final user = User.fromJson(userMap);

      if(user.userData != null){
        storage.setItem('user_logged', {
          'user': user.userData,
          'token': user.token,
          'created_at': DateTime.now().toString()
        });

        Navigator.pushReplacementNamed(context, 'products');
      }
    } else if(res.statusCode == 400){
      final apiMessages = ApiMessages();
      apiMessages.getMessages(userMap, context);
    }
  }

  void logout(token, context, redirect) async {
    String path = "/logout-customers";
    final res = await Api.httpGet(path, token);
    storage.deleteItem("user_logged");

    if(redirect) Navigator.pushReplacementNamed(context, 'login');
  }
}