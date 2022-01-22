class LoginUser {
  int identityNumber;
  String password;
  bool rememberMe;

  LoginUser(
      {required this.identityNumber,
      required this.password,
      required this.rememberMe});

  factory LoginUser.empty() =>
      LoginUser(identityNumber: 0, password: "", rememberMe: false);

  factory LoginUser.fromJson(Map<String, dynamic> json) => LoginUser(
      identityNumber: json["identityNumber"],
      password: json["password"],
      rememberMe: json["rememberMe"]);

  Map<String, dynamic> toJson() => {
        "identityNumber": identityNumber,
        "password": password,
        "rememberMe": rememberMe
      };
}
