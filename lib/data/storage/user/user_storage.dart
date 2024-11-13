import 'dart:async';

import 'package:happy_pet/data/dto/user/user.dart';
import 'package:hive/hive.dart';

class UserStorage {
  factory UserStorage() {
    return _singleton;
  }

  UserStorage._();

  static final UserStorage _singleton = UserStorage._();
  Box<UserDTO>? _userBox;

  Future<void> init() async {
    _userBox = await Hive.openBox<UserDTO>('user_box');
  }

  Future<void> saveUser(UserDTO user) async {
    await _userBox?.put(user.username, user);
  }

  Future<UserDTO?> getUser(String name) async {
    return _userBox?.get(name);
  }

  Future<bool> authUser(String username, String password) async{
    var box = await Hive.openBox<UserDTO>('user_box');
    for(var user in box.values){
      if(user.username == username && user.password == password){
        return true;
      }
    }
    return false;
  }

  late UserDTO _user;
  UserDTO get user => _user;
  set setUser(UserDTO user) => _user = user;

}
