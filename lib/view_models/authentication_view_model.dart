import 'package:ab_assignment/locator.dart';
import 'package:ab_assignment/models/login_user.dart';
import 'package:ab_assignment/network/network_state.dart';
import 'package:ab_assignment/repositories/authentication_repository.dart';
import 'package:ab_assignment/utils/route.dart';
import 'package:flutter/material.dart';

class AuthenticationViewModel extends ChangeNotifier {
  final BuildContext context;
  final _authRepository = locator<AuthenticationRepository>();
  late NetworkState _loginState;

  NetworkState get loginState => _loginState;

  set loginState(NetworkState loginState) {
    _loginState = loginState;
    notifyListeners();
  }

  get loginUser => _authRepository.loginUser;

  AuthenticationViewModel(this.context) {
    _loginState = NetworkState.loaded;
  }

  Future<void> login(LoginUser loginUser) async {
    loginState = NetworkState.loading;
    var state = await _authRepository.login(loginUser);
    if (state.isLoaded) {
      Navigator.pushNamedAndRemoveUntil(
          context, routeMain, ModalRoute.withName(routeRoot));
    }
  }

  Future<void> logout() async {
    final response = await _authRepository.logout();
    if (response.isLoaded) {
      Navigator.pushNamedAndRemoveUntil(
          context, routeRoot, ModalRoute.withName(routeRoot));
    }
  }
}
