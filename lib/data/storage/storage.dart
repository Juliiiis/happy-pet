import 'package:flutter/material.dart';
import 'package:happy_pet/data/dto/category/category.dart';
import 'package:happy_pet/data/dto/pet/pet.dart';
import 'package:happy_pet/data/dto/tag/tag.dart';
import 'package:happy_pet/data/dto/user/user.dart';
import 'package:happy_pet/data/storage/pet/pet_storage.dart';
import 'package:happy_pet/data/storage/user/user_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Storage {
  factory Storage() {
    return _singleton;
  }

  Storage._();

  static final Storage _singleton = Storage._();

  Future<void> init() async {
    await Hive.initFlutter();

    _registerAdapters();
    await _initBoxes();
  }

  void _registerAdapters() {
    Hive.registerAdapter(UserDTOAdapter());
    Hive.registerAdapter(PetDTOAdapter());
    Hive.registerAdapter(CategoryDTOAdapter());
    Hive.registerAdapter(TagDTOAdapter());
  }

  Future<void> _initBoxes() async {
    await UserStorage().init();
    await PetStorage().init();
  }
}
