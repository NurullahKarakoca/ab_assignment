import 'package:ab_assignment/models/money_transfer_model.dart';
import 'package:ab_assignment/utils/dimen.dart';
import 'package:ab_assignment/utils/string.dart';
import 'package:ab_assignment/widgets/moneytransfer/previos_step_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'next_step_button.dart';

class TransferInformationStepContent extends StatefulWidget {
  final MoneyTransferModel model;
  final Function() onNextStep;
  final Function() onPreviousStep;

  const TransferInformationStepContent(
      {Key? key,
      required this.model,
      required this.onNextStep,
      required this.onPreviousStep})
      : super(key: key);

  @override
  _TransferInformationStepContentState createState() =>
      _TransferInformationStepContentState();
}

class _TransferInformationStepContentState
    extends State<TransferInformationStepContent> {
  final _formKey = GlobalKey<FormState>();
  final _currentDate = DateTime.now();
  final _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _dateController,
              onTap: () async {
                final date = await showDatePicker(
                    context: context,
                    initialDate: widget.model.transferDate ?? _currentDate,
                    firstDate: _currentDate,
                    lastDate: _currentDate.add(Duration(days: 30)));
                if (date != null) {
                  setState(() {
                    widget.model.transferDate = date;
                    _dateController.text = DateFormat.yMMMMEEEEd().format(date);
                  });
                }
              },
              readOnly: true,
              decoration: InputDecoration(
                  labelText: "İşlem Tarihi",
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          widget.model.transferDate = null;
                          _dateController.text = "";
                        });
                      },
                      icon: Icon(Icons.close))),
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return requiredErrorMessage;
                }
              },
            ),
            const SizedBox(
              height: paddingSizeSmall,
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration:
                  InputDecoration(label: Text("Tutar"), suffixText: "TL"),
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return requiredErrorMessage;
                }
              },
              onSaved: (value) {
                widget.model.amount = double.parse(value!);
              },
            ),
            const SizedBox(
              height: paddingSizeSmall,
            ),
            TextFormField(
              maxLines: 2,
              decoration: InputDecoration(
                label: Text("Açıklama"),
              ),
              onSaved: (value) {
                widget.model.explanation = value;
              },
            ),
            const SizedBox(
              height: paddingSizeSmall,
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
        ));
  }
}
