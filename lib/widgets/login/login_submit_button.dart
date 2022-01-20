import 'package:ab_assignment/utils/dimen.dart';
import 'package:ab_assignment/utils/string.dart';
import 'package:flutter/material.dart';

class LoginSubmitButton extends StatelessWidget {
  final Function()? onPressed;

  const LoginSubmitButton({Key? key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
        constraints: const BoxConstraints(minWidth: maxButtonWidth),
        child: ElevatedButton(onPressed: onPressed, child: const Text(login)));
  }
}
