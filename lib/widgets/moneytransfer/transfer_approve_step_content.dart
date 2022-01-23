import 'package:ab_assignment/models/money_transfer_model.dart';
import 'package:ab_assignment/utils/dimen.dart';
import 'package:ab_assignment/utils/route.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransferApproveStepContent extends StatefulWidget {
  final MoneyTransferModel model;
  final Function onApprove;

  const TransferApproveStepContent(
      {Key? key, required this.model, required this.onApprove})
      : super(key: key);

  @override
  _TransferApproveStepContentState createState() =>
      _TransferApproveStepContentState();
}

class _TransferApproveStepContentState
    extends State<TransferApproveStepContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: Container(
            padding: const EdgeInsets.all(paddingSizeSmall),
            width: double.maxFinite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Alıcı Bilgileri",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const Divider(),
                Text(
                  "Nu**** Ka*****",
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                Text(
                  "ALTERNATİFBANK A.Ş.",
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                Text(
                  "${widget.model.ibanNumber}",
                  style: Theme.of(context).textTheme.caption,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: paddingSizeMedium,
        ),
        Card(
          child: Container(
            padding: const EdgeInsets.all(paddingSizeSmall),
            width: double.maxFinite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Transfer Bilgileri",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Transfer Tutarı"),
                    Text("${widget.model.amount} TL"),
                  ],
                ),
                const SizedBox(
                  height: paddingSizeSmall,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text("İşlem Ücreti"),
                    Text("0 TL"),
                  ],
                ),
                const SizedBox(
                  height: paddingSizeSmall,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Toplam Tutar"),
                    Text("${widget.model.amount} TL"),
                  ],
                ),
                const SizedBox(
                  height: paddingSizeSmall,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Gerçekleşme Tarihi"),
                    Text(DateFormat("dd/MM/yyyy")
                        .format(widget.model.transferDate!)),
                  ],
                ),
                const SizedBox(
                  height: paddingSizeSmall,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Açıklama"),
                    Text(widget.model.explanation!),
                  ],
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          height: paddingSizeMedium,
        ),
        SizedBox(
            width: double.maxFinite,
            child: ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            title: Text("Para Transfer Onayı"),
                            content:
                                Text("Para transferi başarıyla gerçekleşti."),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    Navigator.pushReplacementNamed(
                                      context,
                                      routeMain,
                                    );
                                  },
                                  child: Text("Tamam"))
                            ],
                          ));
                },
                child: const Text("İşlemi Onayla")))
      ],
    );
  }
}
