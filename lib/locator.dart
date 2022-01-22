import 'package:ab_assignment/db/shared_pref.dart';
import 'package:ab_assignment/network/api_network_interceptor.dart';
import 'package:ab_assignment/repositories/authentication_repository.dart';
import 'package:ab_assignment/repositories/bank_account_repository.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final locator = GetIt.asNewInstance();

Future<void> initLocator() async {
  var dio = Dio(BaseOptions());
  dio.interceptors.add(ApiNetworkInterceptor());
  var preferences = await SharedPreferences.getInstance();

  locator.registerLazySingleton(() => dio);
  locator.registerLazySingleton(() => SharedPref(preferences));

  locator.registerLazySingleton(() => AuthenticationRepository());
  locator.registerLazySingleton(() => BankAccountRepository());
}
