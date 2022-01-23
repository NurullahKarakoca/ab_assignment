class LoginUser {
  int identityNumber;
  String password;
  String token;
  bool rememberMe;

  LoginUser(
      {required this.identityNumber,
      required this.password,
      required this.token,
      required this.rememberMe});

  factory LoginUser.empty() =>
      LoginUser(identityNumber: 0, password: "", token: "", rememberMe: false);

  factory LoginUser.fromJson(Map<String, dynamic> json) => LoginUser(
      identityNumber: json["identityNumber"],
      password: json["password"],
      token: json["token"],
      rememberMe: json["rememberMe"]);

  Map<String, dynamic> toJson() => {
        "identityNumber": identityNumber,
        "password": password,
        "token": token,
        "rememberMe": rememberMe
      };
}
