import 'package:ab_assignment/models/bank_account.dart';
import 'package:ab_assignment/widgets/bank_account/bank_accounts_dialog.dart';
import 'package:flutter/material.dart';

class SelectBankAccount extends StatelessWidget {
  final BankAccount? bankAccount;
  final Function(BankAccount)? onSelectBankAccount;

  const SelectBankAccount(
      {Key? key, this.bankAccount, this.onSelectBankAccount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (bankAccount == null) {
      return SizedBox(
        width: double.infinity,
        child: OutlinedButton(
          onPressed: () {
            showBankAccountsDialog(context);
          },
          child: Text("Hesap Seçiniz"),
        ),
      );
    }

    return SizedBox.shrink();
  }
}
