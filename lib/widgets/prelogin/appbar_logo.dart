import 'package:flutter/material.dart';

class AppbarLogo extends StatelessWidget {
  const AppbarLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/logo.png",
      scale: 2.5,
    );
  }
}
