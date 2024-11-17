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

  Future<bool> createUser({required UserDTO user}) async {
    final createResult = await _userApi.createUser(user: user);
    if (!createResult) return false;
    if (user.username == null) return false;
    final userResult = await _getUserByName(username: user.username!);
    if (userResult == null) return false;
    return true;
  }

  Future<bool> login({required String uName, required String uPassword}) async {
    final storedUser = await _userStorage.getUser(uName);
    final loginResult = await _userApi.login(username: uName, password: uPassword);
    if (!loginResult && storedUser == null) return false;
    if (loginResult && storedUser != null) {
      _userStorage.setUser = storedUser;
      return true;
    }
    if (!loginResult && storedUser != null) {
      if (uName == storedUser.username && uPassword == storedUser.password) {
        final createResult = await createUser(user: storedUser);
        if (!createResult) return false;
        return true;
      }
    }
    return loginResult;
  }

  Future<UserDTO?> _getUserByName({required String username}) async {
    final storedUser = await _userStorage.getUser(username);
    final result = await _userApi.getUserByName(username: username);
    if (result != null && storedUser == null) {
      await _userStorage.saveUser(result);
      _userStorage.setUser = result;
      return result;
    }
    if (result != null && storedUser != null) {
      final isEqual = result.username == storedUser.username &&
          result.password == storedUser.password &&
          result.email == storedUser.email;
      if (isEqual) {
        _userStorage.setUser = result;
        return result;
      }
      await _userStorage.saveUser(result);
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
    final newUser = await _getUserByName(username: uName);
    if (newUser == null) return false;
    return true;
  }
}
