import 'package:dio/dio.dart';

class DioModule {
  final Dio _dio = Dio();

  DioModule._privateConstructor();

  static final DioModule instance = DioModule._privateConstructor();

  Dio service() {
//    _dio.interceptors.add(ApiInterceptor());
    // _dio.interceptors.add(LogInterceptor(
    //   request: true,
    //   requestBody: true,
    //   requestHeader: true,
    // ));
    return _dio;
  }
}
