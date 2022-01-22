import 'package:ab_assignment/models/bank_account.dart';
import 'package:ab_assignment/view_models/bank_account_view_model.dart';
import 'package:ab_assignment/widgets/bank_account/bank_account_list_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BankAccountsDialog extends StatefulWidget {
  const BankAccountsDialog({Key? key}) : super(key: key);

  @override
  _BankAccountsDialogState createState() => _BankAccountsDialogState();
}

class _BankAccountsDialogState extends State<BankAccountsDialog> {
  @override
  Widget build(BuildContext context) {
    return Consumer<BankAccountViewModel>(builder: (context, viewModel, child) {
      final list = viewModel.bankAccountsState.data as List<BankAccount>?;

      return AlertDialog(
          scrollable: true,
          title: Text("Banka hesabı seç."),
          content: viewModel.bankAccountsState.isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    for (var item in list!)
                      BankAccountListItem(bankAccount: item)
                  ],
                ));
    });
  }
}

Future<BankAccount?> showBankAccountsDialog(BuildContext context) {
  return showDialog(
      context: context,
      builder: (context) => ChangeNotifierProvider(
          create: (context) => BankAccountViewModel(),
          child: BankAccountsDialog()));
}
