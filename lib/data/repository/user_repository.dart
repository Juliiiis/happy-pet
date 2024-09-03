import 'dart:async';

import 'package:happy_pet/data/network/user_api.dart';

class UserRepository{
  factory UserRepository(){
    return _singleton;
  }
   UserRepository._();

  static final UserRepository _singleton = UserRepository._();

  final _userApi = UserApi();

  Future<>_userApi.updateUser(){}
}