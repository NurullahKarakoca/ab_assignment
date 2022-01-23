import 'package:flutter/material.dart';

class ContinueButton extends StatelessWidget {
  final Function() onPressed;

  const ContinueButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: ElevatedButton(onPressed: onPressed, child: Text("Devam Et")));
  }
}
