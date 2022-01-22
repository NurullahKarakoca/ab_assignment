import 'package:ab_assignment/utils/dimen.dart';
import 'package:flutter/material.dart';

class ErrorText extends StatelessWidget {
  final String text;

  const ErrorText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(paddingSize),
      decoration: ShapeDecoration(
          color: Colors.red,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(cornerRadius))),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
