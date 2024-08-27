import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class AuthUser {
  final TextEditingController nameTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();

  Future<void> authUser() async {
    final response = await Dio().get(
        'https://petstore.swagger.io/v2/user/login');
    debugPrint(response.toString());
  }
}