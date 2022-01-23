import 'package:flutter/material.dart';

class TransactionTypeRadio extends StatelessWidget {
  final String type;
  final String? selectedType;
  final Function() onSelect;

  const TransactionTypeRadio(
      {Key? key, required this.type, required this.onSelect, this.selectedType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSelect,
      child: Row(
        children: [
          Radio<String>(
            value: type,
            groupValue: selectedType,
            onChanged: (value) {},
            activeColor: Theme.of(context).colorScheme.primary,
          ),
          Expanded(child: Text(type))
        ],
      ),
    );
  }
}
