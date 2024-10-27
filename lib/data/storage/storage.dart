import 'package:flutter/material.dart';
import 'package:happy_pet/data/dto/pet/pet.dart';
import 'package:happy_pet/data/dto/user/user.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Storage {
  factory Storage() {
    return _singleton;
  }

  Storage._();

  static final Storage _singleton = Storage._();

  Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Hive.initFlutter();
    Hive.registerAdapter(UserDTOAdapter());
    Hive.registerAdapter(PetDTOAdapter());
  }
}