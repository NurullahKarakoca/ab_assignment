import 'package:ab_assignment/models/bank_account.dart';
import 'package:ab_assignment/utils/dimen.dart';
import 'package:flutter/material.dart';

class BankAccountListItem extends StatelessWidget {
  final BankAccount bankAccount;

  const BankAccountListItem({Key? key, required this.bankAccount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(cornerRadius))),
      child: Column(
        children: [
          Text(bankAccount.number),
          Text(bankAccount.branch),
          Row(
            children: [
              Text("Kullanılabilir Bakiye"),
              Text(bankAccount.availableBalance.toString())
            ],
          ),
          Row(
            children: [Text("Bakiye"), Text(bankAccount.balance.toString())],
          )
        ],
      ),
    );
  }
}
