import 'package:flutter/material.dart';
import 'package:happy_pet/data/storage/storage.dart';
import 'package:happy_pet/happy_pet.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Storage().init();

  runApp(const HappyPet());
}
