import 'package:ab_assignment/utils/string.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class IdNumberTextField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String)? onFieldSubmitted;

  const IdNumberTextField(
      {Key? key, required this.controller, this.onFieldSubmitted})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.next,
      maxLength: 11,
      onFieldSubmitted: onFieldSubmitted,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return requiredErrorMessage;
        } else if (value!.length != 11) {
          return idNumberLengthErrorMessage;
        }
      },
      decoration: const InputDecoration(
          label: Text(idNumber), prefixIcon: Icon(Icons.person_outlined)),
    );
  }
}
