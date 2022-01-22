class BankAccount {
  String number;
  String branch;
  String type;
  double availableBalance;
  double balance;

  BankAccount(
      {required this.number,
      required this.branch,
      required this.type,
      required this.availableBalance,
      required this.balance});

  factory BankAccount.fromJson(Map<String, dynamic> json) => BankAccount(
      number: json["number"],
      branch: json["branch"],
      type: json["type"],
      availableBalance: json["availableBalance"],
      balance: json["balance"]);

  Map<String, dynamic> toJson() => {
        "number": number,
        "branch": branch,
        "type": type,
        "availableBalance": availableBalance,
        "balance": balance
      };
}
