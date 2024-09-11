import 'package:happy_pet/data/dto/user/user.dart';

class UserStorage {
  factory UserStorage() {
    return _singleton;
  }

  UserStorage._();

  static final UserStorage _singleton = UserStorage._();

  late UserDTO _user;

  UserDTO get user => _user;

  set setUser(UserDTO user) => _user = user;
}
