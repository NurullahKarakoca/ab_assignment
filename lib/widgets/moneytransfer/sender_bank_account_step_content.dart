import 'package:ab_assignment/models/money_transfer_model.dart';
import 'package:ab_assignment/utils/dimen.dart';
import 'package:ab_assignment/widgets/bank_account/select_bank_account.dart';
import 'package:flutter/material.dart';

import 'continue_button.dart';

class SenderBankAccountStepContent extends StatefulWidget {
  final MoneyTransferModel model;
  final Function() onNextStep;

  const SenderBankAccountStepContent(
      {Key? key, required this.model, required this.onNextStep})
      : super(key: key);

  @override
  _SenderBankAccountStepContentState createState() =>
      _SenderBankAccountStepContentState();
}

class _SenderBankAccountStepContentState
    extends State<SenderBankAccountStepContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SelectBankAccount(
          onSelect: (bankAccount) {
            setState(() {
              widget.model.bankAccount = bankAccount;
            });
          },
        ),
        SizedBox(
          height: paddingSize,
        ),
        Text(
            "İşlemin gerçekleştiği tarihte hesabınızda yeterli bakiye bulunması gerekmektedir."),
        SizedBox(
          height: paddingSize,
        ),
        if (widget.model.bankAccount != null)
          ContinueButton(
            onPressed: () {
              widget.onNextStep();
            },
          )
      ],
    );
  }
}
