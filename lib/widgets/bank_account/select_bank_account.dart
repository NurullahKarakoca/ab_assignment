import 'package:ab_assignment/models/bank_account.dart';
import 'package:ab_assignment/widgets/bank_account/bank_account_list_item.dart';
import 'package:ab_assignment/widgets/bank_account/bank_accounts_dialog.dart';
import 'package:flutter/material.dart';

class SelectBankAccount extends StatelessWidget {
  final BankAccount? bankAccount;
  final Function(BankAccount) onSelect;

  const SelectBankAccount(
      {Key? key, required this.onSelect, required this.bankAccount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (bankAccount == null) {
      return SizedBox(
        width: double.infinity,
        child: OutlinedButton(
          onPressed: () async {
            _showBankAccountsDialog(context);
          },
          child: Text("Hesap Seçiniz"),
        ),
      );
    }

    return BankAccountListItem(
      bankAccount: bankAccount!,
      onTap: () {
        _showBankAccountsDialog(context);
      },
    );
  }

  Future<void> _showBankAccountsDialog(BuildContext context) async {
    final selectedBankAccount = await showBankAccountsDialog(context);
    if (selectedBankAccount != null) {
      onSelect.call(selectedBankAccount);
    }
  }
}
