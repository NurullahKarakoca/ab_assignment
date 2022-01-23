import 'package:ab_assignment/models/bank_account.dart';
import 'package:ab_assignment/widgets/bank_account/bank_account_list_item.dart';
import 'package:ab_assignment/widgets/bank_account/bank_accounts_dialog.dart';
import 'package:flutter/material.dart';

class SelectBankAccount extends StatefulWidget {
  final Function(BankAccount) onSelect;

  const SelectBankAccount({Key? key, required this.onSelect}) : super(key: key);

  @override
  State<SelectBankAccount> createState() => _SelectBankAccountState();
}

class _SelectBankAccountState extends State<SelectBankAccount> {
  BankAccount? _bankAccount;

  @override
  Widget build(BuildContext context) {
    if (_bankAccount == null) {
      return SizedBox(
        width: double.infinity,
        child: OutlinedButton(
          onPressed: () async {
            _showBankAccountsDialog();
          },
          child: Text("Hesap Seçiniz"),
        ),
      );
    }

    return BankAccountListItem(
      bankAccount: _bankAccount!,
      onTap: () {
        _showBankAccountsDialog();
      },
    );
  }

  Future<void> _showBankAccountsDialog() async {
    final selectedBankAccount = await showBankAccountsDialog(context);
    if (selectedBankAccount != null) {
      setState(() {
        _bankAccount = selectedBankAccount;
        widget.onSelect.call(selectedBankAccount);
      });
    }
  }
}
