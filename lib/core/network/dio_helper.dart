import 'package:dio/dio.dart';
import 'package:my_memories/core/network/api_constants.dart';

class DioHelper {
  static late Dio dio;

  static void init(){
    dio=Dio(
    BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds:10),
      receiveTimeout: const Duration(seconds:10),
      responseType: ResponseType.json,
    ),
    );
  }
}