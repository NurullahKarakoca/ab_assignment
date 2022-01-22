import 'package:ab_assignment/widgets/bank_account/select_bank_account.dart';
import 'package:flutter/material.dart';

class MoneyTransferPage extends StatefulWidget {
  const MoneyTransferPage({Key? key}) : super(key: key);

  @override
  _MoneyTransferPageState createState() => _MoneyTransferPageState();
}

class _MoneyTransferPageState extends State<MoneyTransferPage> {
  @override
  Widget build(BuildContext context) {
    int currentStep = 0;

    return Stepper(
        physics: const ScrollPhysics(),
        currentStep: currentStep,
        controlsBuilder: (context, details) => SizedBox.shrink(),
        steps: [
          Step(
              title: Text("Gönderen Hesap"),
              content: SelectBankAccount(),
              state: StepState.complete),
          Step(title: Text("Alıcı Bilgileri"), content: Container()),
          Step(title: Text("Transfer Bilgileri"), content: Container())
        ]);
  }
}
