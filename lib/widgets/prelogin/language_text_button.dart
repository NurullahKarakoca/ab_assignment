import 'package:ab_assignment/utils/dimen.dart';
import 'package:ab_assignment/utils/string.dart';
import 'package:flutter/material.dart';

class LanguageTextButton extends StatelessWidget {
  const LanguageTextButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {},
        child: Text(
          languageText,
          style: TextStyle(color: Colors.white.withAlpha(textColorAlpha)),
        ));
  }
}
