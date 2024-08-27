import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class AddUser {
  final TextEditingController nameTextController = TextEditingController();
  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();


  Future<void> postUser() async {
    final String name = nameTextController.text;
    final String email = emailTextController.text;
    final String password = passwordTextController.text;

    final response = await Dio().post(
        'https://petstore.swagger.io/v2/user',
        data: {
          'name': name,
          'email' : email,
          'password': password,
        }
    );
  }
}

