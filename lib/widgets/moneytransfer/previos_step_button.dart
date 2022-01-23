import 'package:flutter/material.dart';

class PreviousStepButton extends StatelessWidget {
  final Function() onPressed;

  const PreviousStepButton({Key? key, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(onPressed: onPressed, child: Text("Geri"));
  }
}
