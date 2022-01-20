import 'package:ab_assignment/utils/string.dart';
import 'package:flutter/material.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      welcome,
      style: Theme.of(context).textTheme.headline5?.apply(
            color: Colors.white,
          ),
    );
  }
}
