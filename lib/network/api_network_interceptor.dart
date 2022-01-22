import 'package:dio/dio.dart';

class ApiNetworkInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.baseUrl = "http://192.168.1.49:3000/";
    handler.next(options);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      err.error = "Kullanıcı bilgileri hatalı";
    } else {
      print(err.error);
      err.error = "Bir hata oluştu.";
    }
    handler.next(err);
  }
}
