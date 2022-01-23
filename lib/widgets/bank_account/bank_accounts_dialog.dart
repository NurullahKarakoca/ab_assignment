import 'package:ab_assignment/models/bank_account.dart';
import 'package:ab_assignment/utils/dimen.dart';
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
          title: const Text("Banka hesabı seç."),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("İptal"))
          ],
          content: viewModel.bankAccountsState.isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    for (var item in list!) ...[
                      BankAccountListItem(
                        bankAccount: item,
                        onTap: () {
                          Navigator.pop(context, item);
                        },
                      ),
                      const SizedBox(
                        height: paddingSizeSmall,
                      )
                    ]
                  ],
                ));
    });
  }
}

Future<BankAccount?> showBankAccountsDialog(BuildContext context) {
  return showDialog<BankAccount?>(
      context: context,
      builder: (context) => ChangeNotifierProvider(
          create: (context) => BankAccountViewModel(),
          child: const BankAccountsDialog()));
}
