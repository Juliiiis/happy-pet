import 'dart:async';

import 'package:happy_pet/data/dto/user/user.dart';
import 'package:happy_pet/data/network/user_api.dart';
import 'package:happy_pet/data/storage/user/user_storage.dart';

class UserRepository {
  factory UserRepository() {
    return _singleton;
  }

  UserRepository._();

  static final UserRepository _singleton = UserRepository._();

  final _userApi = UserApi();
  final _userStorage = UserStorage();

  Future<UserDTO?> getUserByName({required String username}) async {
    final result = await _userApi.getUserByName(username: username);
    if (result != null) {
      _userStorage.setUser = result;
      return result;
    }
    return null;
  }

  Future<bool> updateUser({required UserDTO updaterUser}) async {
    final uName = _userStorage.user.username;
    if (uName == null) return false;
    final restResult = await _userApi.updateUser(username: uName, userBody: updaterUser);
    if (!restResult) return false;
    final newUser = await getUserByName(username: uName);
    if (newUser == null) return false;
    return true;
  }
}
