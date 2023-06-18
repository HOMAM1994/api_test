import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    //a266b0cf79ed45be8861f6029ec98199
    dio = Dio(BaseOptions(
      baseUrl: 'https://newsapi.org/',
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response> getData ({required String url,
    required dynamic query }) async {
   return await dio!.get(url, queryParameters: query);
  }
}
