import 'package:ab_assignment/db/shared_pref.dart';
import 'package:dio/dio.dart';

import '../locator.dart';

class ApiNetworkInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = locator<SharedPref>().loginUser.token;
    options.baseUrl = "https://abassignment.herokuapp.com/";
    options.connectTimeout = 10000;
    options.headers.addAll({"authorization": "Bearer $token"});
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
