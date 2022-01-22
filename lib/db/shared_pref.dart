import 'dart:convert';

import 'package:ab_assignment/models/login_user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  final _loginUserKey = "loginUser";

  final SharedPreferences _preferences;

  SharedPref(this._preferences);

  LoginUser get loginUser {
    final jsonStr = _preferences.getString(_loginUserKey);
    if (jsonStr == null) {
      return LoginUser.empty();
    }
    final json = jsonDecode(jsonStr);
    return LoginUser.fromJson(json);
  }

  set loginUser(LoginUser loginUser) {
    final json = loginUser.toJson();
    final jsonStr = jsonEncode(json);
    _preferences.setString(_loginUserKey, jsonStr);
  }
}
