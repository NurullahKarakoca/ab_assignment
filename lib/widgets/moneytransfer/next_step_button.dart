import 'package:flutter/material.dart';

class NextStepButton extends StatelessWidget {
  final Function() onPressed;

  const NextStepButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed, child: Text("Devam Et"));
  }
}
