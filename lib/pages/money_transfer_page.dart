import 'package:ab_assignment/models/money_transfer_model.dart';
import 'package:ab_assignment/widgets/moneytransfer/receiver_information_step_content.dart';
import 'package:ab_assignment/widgets/moneytransfer/sender_bank_account_step_content.dart';
import 'package:ab_assignment/widgets/moneytransfer/transfer_approve_step_content.dart';
import 'package:ab_assignment/widgets/moneytransfer/transfer_information_step_content.dart';
import 'package:flutter/material.dart';

class MoneyTransferPage extends StatefulWidget {
  const MoneyTransferPage({Key? key}) : super(key: key);

  @override
  _MoneyTransferPageState createState() => _MoneyTransferPageState();
}

class _MoneyTransferPageState extends State<MoneyTransferPage> {
  int _currentStep = 0;
  var _moneyTransferModel = MoneyTransferModel();

  @override
  Widget build(BuildContext context) {
    return Stepper(
        physics: const ScrollPhysics(),
        onStepTapped: (step) {
          if (_currentStep > step) {
            setState(() {
              _currentStep = step;
            });
          }
        },
        currentStep: _currentStep,
        controlsBuilder: (context, details) {
          return const SizedBox.shrink();
        },
        steps: [
          Step(
            title: const Text("Gönderen Hesap"),
            content: SenderBankAccountStepContent(
              model: _moneyTransferModel,
              onNextStep: () {
                setState(() {
                  _currentStep = 1;
                });
              },
            ),
          ),
          Step(
            title: const Text("Alıcı Bilgileri"),
            content: ReceiverInformationStepContent(
                model: _moneyTransferModel,
                onNextStep: () {
                  setState(() {
                    _currentStep = 2;
                  });
                },
                onPreviousStep: () {
                  setState(() {
                    _currentStep = 0;
                  });
                }),
          ),
          Step(
            title: const Text("Transfer Bilgileri"),
            content: TransferInformationStepContent(
                model: _moneyTransferModel,
                onNextStep: () {
                  setState(() {
                    _currentStep = 3;
                  });
                },
                onPreviousStep: () {
                  setState(() {
                    _currentStep = 1;
                  });
                }),
          ),
          Step(
              title: const Text("İşlem Onayı"),
              content: TransferApproveStepContent(
                model: _moneyTransferModel,
                onApprove: () {
                  setState(() {
                    _moneyTransferModel = MoneyTransferModel();
                    _currentStep = 0;
                  });
                },
              ))
        ]);
  }
}
