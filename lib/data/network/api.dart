import 'package:dio/dio.dart';

class Api {
  factory Api() {
    return _singleton;
  }

  Api._();

  static final Api _singleton = Api._();

  static final dio = Dio();
}
