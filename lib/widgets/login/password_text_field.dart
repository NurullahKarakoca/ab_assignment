import 'package:ab_assignment/utils/string.dart';
import 'package:flutter/material.dart';

class PasswordTextField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode? focusNode;
  final Function(String)? onFieldSubmitted;

  const PasswordTextField(
      {Key? key,
      required this.controller,
      this.onFieldSubmitted,
      this.focusNode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: true,
      focusNode: focusNode,
      textInputAction: TextInputAction.done,
      onFieldSubmitted: onFieldSubmitted,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return requiredErrorMessage;
        } else if (value!.length < 6) {
          return passwordMinLengthErrorMessage;
        }
      },
      decoration: const InputDecoration(
          label: Text(password), prefixIcon: Icon(Icons.lock_outlined)),
    );
  }
}
