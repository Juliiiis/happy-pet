import 'package:dio/dio.dart';
import 'package:happy_pet/core/consts.dart';
import 'package:happy_pet/data/dto/api_response_body.dart';
import 'package:happy_pet/data/dto/user/user.dart';
import 'package:happy_pet/data/network/api.dart';

class UserApi {
  Dio get _dio => Api.dio;

  Future<ApiResponseBodyDTO> createUser({required UserDTO user}) async {
    final response = await _dio.post(
      '${Consts.url}/user',
      data: user.toJson(),
    );
    final result = ApiResponseBodyDTO.fromJson(response.data);
    return result;
  }

  Future<ApiResponseBodyDTO> login({required String username, required String password}) async {
    final response = await _dio.get(
      '${Consts.url}/user/login',
      queryParameters: {
        'username': username,
        'password': password,
      },
    );
    final result = ApiResponseBodyDTO.fromJson(response.data);
    return result;
  }

  Future<UserDTO> getUserByName({required String username}) async{
    final response = await _dio.get('${Consts.url}/user/:username');
    final result = UserDTO.fromJson(response.data);
    return result;
  }
}
