import 'dart:developer';

import 'package:dio/dio.dart';

import 'dio_module.dart';

class ApiInterceptor extends Interceptor {
  Dio get _dioModule => DioModule.instance.service();

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    // print("[onError] ${err.response.statusCode}");
    if (err.response != null) {
      switch (err.response!.statusCode) {
        case 401:
          _dioModule.interceptors
            ..clear()
            ..add(
              QueuedInterceptorsWrapper(
                onRequest: (RequestOptions requestOptions, RequestInterceptorHandler handler) {
                  log("${requestOptions.uri}");
                  Future.delayed(const Duration(seconds: 2), () {
                    handler.next(requestOptions);
                  });
                },
              ),
            );
          // _dioModule.lock();
          // _dioModule.interceptors.requestLock.lock();
          // _dioModule.interceptors.responseLock.lock();
          // RequestOptions options = err.response!.requestOptions;
          // _dioModule.unlock();
          // _dioModule.interceptors.requestLock.unlock();
          // _dioModule.interceptors.responseLock.unlock();
          return handler.next(err);
        default:
      }
    }
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {}

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {}
}
