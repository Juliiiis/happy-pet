import 'package:flutter/material.dart';
import 'package:happy_pet/data/dto/category/category.dart';
import 'package:happy_pet/data/dto/pet/pet.dart';
import 'package:happy_pet/data/dto/tag/tag.dart';
import 'package:happy_pet/data/dto/user/user.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

class Storage {
  factory Storage() {
    return _singleton;
  }

  Storage._();

  static final Storage _singleton = Storage._();

  Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();

    final directory = await getApplicationDocumentsDirectory();
    debugPrint(directory.path);

    await Hive.initFlutter();
    Hive.registerAdapter(UserDTOAdapter());
    Hive.registerAdapter(PetDTOAdapter());
    Hive.registerAdapter(CategoryDTOAdapter());
    Hive.registerAdapter(TagDTOAdapter());
  }
}