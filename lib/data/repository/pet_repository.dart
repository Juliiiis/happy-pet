import 'package:happy_pet/data/dto/pet/pet.dart';
import 'package:happy_pet/data/network/pet_api.dart';
import 'package:happy_pet/data/storage/pet/pet_storage.dart';


class PetRepository{
  factory PetRepository(){
    return _singleton;
  }

  PetRepository._();

  static final PetRepository _singleton = PetRepository._();

  final _petApi = PetApi();
  final _petStorage = PetStorage();

  Future<bool> createPet({required PetDTO pet})async {
    final createResult = await _petApi.createPet(pet: pet);
    if (createResult) {
      await _petStorage.savePet(pet);
      final chlen = await _petStorage.getPet(pet.name!);
      _petStorage.setPet = pet;
    }
    return createResult;
  }

  Future<List<PetDTO>> findByStatus({required List<String> statuses}) async {
    final restResult = await _petApi.findByStatus(statuses: statuses);
    return restResult;
  }

}
