import 'package:dio/dio.dart';
import 'package:streamz/core/services/services.dart';

/*
For more robust state app and API, this would be a good use
But for this app, it's not necessary cause of the Mock API
*/
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
    return handler.next(response);
  }, onError: (DioError e, handler) {
    return handler.next(e);
  }));

  return dio;
}
