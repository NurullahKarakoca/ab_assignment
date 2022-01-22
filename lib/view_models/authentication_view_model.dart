import 'package:ab_assignment/locator.dart';
import 'package:ab_assignment/models/login_user.dart';
import 'package:ab_assignment/network/network_state.dart';
import 'package:ab_assignment/repositories/authentication_repository.dart';
import 'package:flutter/material.dart';

class AuthenticationViewModel extends ChangeNotifier {
  final _authRepository = locator<AuthenticationRepository>();
  late NetworkState _loginState;

  NetworkState get loginState => _loginState;

  set loginState(NetworkState loginState) {
    _loginState = loginState;
    notifyListeners();
  }

  get loginUser => _authRepository.loginUser;

  AuthenticationViewModel() {
    _loginState = NetworkState.loaded;
  }

  Future<void> login(LoginUser loginUser) async {
    loginState = NetworkState.loading;
    loginState = await _authRepository.login(loginUser);
  }

  void logout() => _authRepository.logout();
}
