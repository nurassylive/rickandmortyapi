import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

abstract class Api {
  Future<Response> getData(
    String uri, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  });
}

class ApiService extends Api {
  Dio dio = Dio();

  ApiService() {
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (client) => client..badCertificateCallback = (_, __, ___) => true;
  }

  @override
  Future<Response> getData(
    String uri, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      Response response = await dio.get(
        uri,
        queryParameters: queryParameters,
        options: Options(headers: headers ?? {}),
      );
      return response;
    } on DioError catch (e) {
      print('ApiService getData: ${e.message}');
      rethrow;
    }
  }

  // @override
  // Future<Response> postData(
  //   String uri, {
  //   Map<String, dynamic>? queryParameters,
  //   FormData? data,
  //   Map<String, dynamic>? headers,
  // }) async {
  //   try {
  //     Response response = await dio.post(
  //       uri,
  //       data: data,
  //       queryParameters: queryParameters,
  //       options: Options(
  //           headers: headers ?? {},
  //           followRedirects: false,
  //           validateStatus: (status) {
  //             return status! < 500;
  //           }),
  //     );
  //     return response;
  //   } on DioError catch (e) {
  //     print('ApiService postData: ${e.message}');
  //     rethrow;
  //   }
  // }
}
