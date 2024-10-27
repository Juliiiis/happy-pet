import 'package:flutter/material.dart';
import 'package:happy_pet/data/storage/storage.dart';
import 'package:happy_pet/data/storage/user/user_storage.dart';
import 'package:happy_pet/happy_pet.dart';


void main() async {
  await Storage().init();
  await UserStorage().init();
  runApp(const HappyPet());
}
