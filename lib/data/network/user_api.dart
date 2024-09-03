import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:happy_pet/core/consts.dart';
import 'package:happy_pet/data/dto/api_response_body.dart';
import 'package:happy_pet/data/dto/user/user.dart';
import 'package:happy_pet/data/network/api.dart';
import 'package:happy_pet/data/storage/user/user_storage.dart';

class UserApi {
  Dio get _dio => Api.dio;

  Future<ApiResponseBodyDTO> createUser({required UserDTO user}) async {
    log('HTTP REQUEST /user');
    final response = await _dio.post(
      '${Consts.url}/user',
      data: user.toJson(),
    );
    log('HTTP RESPONSE /user\nSTATUSCODE: ${response.statusCode}\n${response.data.toString()}');
    final result = ApiResponseBodyDTO.fromJson(response.data);
    return result;
  }

  Future<ApiResponseBodyDTO> login(
      {required String username, required String password}) async {
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

  Future<UserDTO?> getUserByName({required String username}) async {
    log('HTTP REQUEST /user/$username');
    final response = await _dio.get('${Consts.url}/user/$username');
    log('HTTP RESPONSE /user/$username\nSTATUSCODE: ${response.statusCode}\n${response.data.toString()}');
    if (response.statusCode == 200) {
      final result = UserDTO.fromJson(response.data);
      UserStorage().setUser = result;
      return result;
    }
    return null;
  }

  Future<ApiResponseBodyDTO> updateUser({required String username, required UserDTO userBody}) async {
    log('HTTP REQUEST /user/$username');
    final response = await _dio.put('${Consts.url}/user/$username',
      data: userBody.toJson()
    );
    log('HTTP RESPONSE /user/$username\nSTATUSCODE: ${response.statusCode}\n${response.data.toString()}');
    final result = ApiResponseBodyDTO.fromJson(response.data);
    return result;
    
  }
}
