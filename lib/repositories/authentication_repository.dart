import 'package:ab_assignment/db/shared_pref.dart';
import 'package:ab_assignment/locator.dart';
import 'package:ab_assignment/models/login_user.dart';
import 'package:ab_assignment/network/network_state.dart';
import 'package:dio/dio.dart';

class AuthenticationRepository {
  final _dio = locator<Dio>();
  final _pref = locator<SharedPref>();

  get loginUser => _pref.loginUser;

  Future<NetworkState> login(LoginUser loginUser) async {
    NetworkState state;
    try {
      await _dio.post("login", data: loginUser.toJson());
      _pref.loginUser = loginUser;
      state = NetworkState.loaded;
    } on DioError catch (e) {
      state = NetworkState.failed(e.error);
    }
    return state;
  }

  logout() {
    _pref.loginUser = LoginUser.empty();
  }
}
