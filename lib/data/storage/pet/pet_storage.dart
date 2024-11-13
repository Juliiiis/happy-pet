import 'dart:async';

import 'package:happy_pet/data/dto/pet/pet.dart';
import 'package:hive_flutter/adapters.dart';

class PetStorage {
  factory PetStorage() {
    return _singleton;
  }

  PetStorage._();

  static final PetStorage _singleton = PetStorage._();
  Box<PetDTO>? _petBox;

  Future<void> init() async {
    _petBox = await Hive.openBox<PetDTO>('pet_box');
  }

  Future<void> savePet(PetDTO pet) async {
    await _petBox?.put(pet.name, pet);
  }

  Future<PetDTO?> getPet(String name) async {
    return _petBox?.get(name);
  }

  Future<List<PetDTO>> getAllPets() async {
    final pets = _petBox?.values.toList();
    return pets?.cast<PetDTO>() ?? [];
  }

  late PetDTO _pet;

  PetDTO get pet => _pet;

  set setPet(PetDTO user) => _pet = pet;
}