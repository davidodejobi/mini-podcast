import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:streamz/core/services/services.dart';

connect() {
  BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: 30000,
      receiveTimeout: 30000,
      responseType: ResponseType.plain);
  Dio dio = Dio(options);

  dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) async {
    return handler.next(options);
  }, onResponse: (response, handler) {
    print(response.statusCode);
    log(response.data.toString());
    return handler.next(response);
  }, onError: (DioError e, handler) {
    return handler.next(e);
  }));

  return dio;
}
