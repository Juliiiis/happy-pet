import 'package:dio/dio.dart';
import 'package:happy_pet/core/consts.dart';
import 'package:happy_pet/data/dto/pet/pet.dart';
import 'package:happy_pet/data/network/api.dart';

class PetApi{
  Dio get _dio => Api.dio;

  Future<PetDTO?> createPet({required PetDTO pet}) async{
    final response = await _dio.post('${Consts.url}/pet',
    data: pet.toJson()
    );
    if(response.statusCode == 200){
      final result = PetDTO.fromJson(response.data);
      return result;
    }
    return null;
  }

  Future<PetDTO?> findPetByID({required int id}) async{
    final response = await _dio.get('${Consts.url}/user/$id');
    if(response.statusCode == 200){
      final result = PetDTO.fromJson(response.data);
      return result;
    }
    return null;
  }

  //Future<void>
}