import 'package:happy_pet/data/dto/pet/pet.dart';

class PetStorage {
  factory PetStorage() {
    return _singleton;
  }

  PetStorage._();

  static final PetStorage _singleton = PetStorage._();

  late PetDTO _pet;

  PetDTO get pet => _pet;

  set setPet(PetDTO user) => _pet = pet;
}