import 'package:bookia_app/core/constants/constatnts.dart';
import 'package:dio/dio.dart';

class DioProvider {
  static late Dio dio;
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: AppConstants.baseUrl,
        // connectTimeout: Duration(seconds: 30),
        // receiveTimeout: Duration(seconds: 30),
      ),
    );
  }

  static Future<Response> post({
    required String endPoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
  }) async {
    return dio.post(
      endPoint,
      data: data,
      queryParameters: query,
      options: Options(headers: headers),
    );
  }

  static Future<Response> get({
    Map<String, dynamic>? headers,

    required String endPoint,
    Map<String, dynamic>? query,
  }) async {
    return dio.get(
      endPoint,
      queryParameters: query,
      options: Options(headers: headers),
    );
  }

  static Future<Response> delete({
    Map<String, dynamic>? headers,

    required String endPoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
  }) async {
    return dio.delete(
      endPoint,
      data: data,
      queryParameters: query,
      options: Options(headers: headers),
    );
  }

  static Future<Response> put({
    Map<String, dynamic>? headers,

    required String endPoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
  }) async {
    return dio.put(
      endPoint,
      data: data,
      queryParameters: query,
      options: Options(headers: headers),
    );
  }
}
