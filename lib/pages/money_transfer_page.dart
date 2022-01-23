import 'package:ab_assignment/models/money_transfer_model.dart';
import 'package:ab_assignment/widgets/moneytransfer/sender_bank_account_step_content.dart';
import 'package:flutter/material.dart';

class MoneyTransferPage extends StatefulWidget {
  const MoneyTransferPage({Key? key}) : super(key: key);

  @override
  _MoneyTransferPageState createState() => _MoneyTransferPageState();
}

class _MoneyTransferPageState extends State<MoneyTransferPage> {
  int _currentStep = 0;
  final _moneyTransferModel = MoneyTransferModel();

  get senderAccountStepState =>
      _currentStep != 0 ? StepState.complete : StepState.editing;

  @override
  Widget build(BuildContext context) {
    return Stepper(
        physics: const ScrollPhysics(),
        currentStep: _currentStep,
        controlsBuilder: (context, details) {
          return SizedBox.shrink();
        },
        steps: [
          Step(
              title: Text("Gönderen Hesap"),
              content: SenderBankAccountStepContent(
                model: _moneyTransferModel,
                onNextStep: () {
                  setState(() {
                    _currentStep = 1;
                  });
                },
              ),
              state: senderAccountStepState),
          Step(title: Text("Alıcı Bilgileri"), content: Container()),
          Step(title: Text("Transfer Bilgileri"), content: Container())
        ]);
  }
}
