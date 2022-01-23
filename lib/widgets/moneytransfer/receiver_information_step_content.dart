import 'package:ab_assignment/models/money_transfer_model.dart';
import 'package:ab_assignment/utils/dimen.dart';
import 'package:ab_assignment/utils/string.dart';
import 'package:ab_assignment/widgets/moneytransfer/next_step_button.dart';
import 'package:ab_assignment/widgets/moneytransfer/previos_step_button.dart';
import 'package:ab_assignment/widgets/moneytransfer/transaction_type_radio.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class ReceiverInformationStepContent extends StatefulWidget {
  final MoneyTransferModel model;
  final Function() onNextStep;
  final Function() onPreviousStep;

  const ReceiverInformationStepContent(
      {Key? key,
      required this.model,
      required this.onNextStep,
      required this.onPreviousStep})
      : super(key: key);

  @override
  _ReceiverInformationStepContentState createState() =>
      _ReceiverInformationStepContentState();
}

class _ReceiverInformationStepContentState
    extends State<ReceiverInformationStepContent> {
  final _formKey = GlobalKey<FormState>();
  final _transactionTypes = [
    "IBAN'a Gönder",
    "Hesap No'ya Gönder",
    "Kredi Kartına Gönder",
    "Kolay Adres'e Gönder",
  ];

  final _ibanMaskFormatter = MaskTextInputFormatter(
      mask: 'TR## #### #### #### #### #### ## ',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  @override
  void initState() {
    widget.model.transactionType = _transactionTypes.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "İŞLEM TÜRÜ",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          for (var type in _transactionTypes)
            TransactionTypeRadio(
              type: type,
              selectedType: widget.model.transactionType,
              onSelect: () {
                setState(() {
                  widget.model.transactionType = type;
                });
              },
            ),
          const SizedBox(
            height: paddingSize,
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            inputFormatters: [_ibanMaskFormatter],
            decoration: InputDecoration(label: Text("IBAN")),
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return requiredErrorMessage;
              } else if (value!.replaceAll(" ", "").length != 26) {
                return "IBAN numarası eksik yada hatalı.";
              }
            },
            onSaved: (value) {
              widget.model.ibanNumber = value;
            },
          ),
          const SizedBox(
            height: paddingSizeMedium,
          ),
          TextFormField(
            decoration: InputDecoration(label: Text("Ad Soyad")),
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return requiredErrorMessage;
              }
            },
            onSaved: (value) {
              widget.model.nameSurname = value;
            },
          ),
          const SizedBox(
            height: paddingSize,
          ),
          Row(
            children: [
              Expanded(
                child: NextStepButton(onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    _formKey.currentState!.save();
                    widget.onNextStep();
                  }
                }),
              ),
              const SizedBox(
                width: paddingSizeSmall,
              ),
              PreviousStepButton(
                onPressed: () {
                  widget.onPreviousStep();
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
