import 'package:ab_assignment/utils/dimen.dart';
import 'package:ab_assignment/utils/route.dart';
import 'package:ab_assignment/utils/string.dart';
import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: maxButtonWidth),
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, routeLogin);
        },
        child: const Text(login),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.white),
            foregroundColor: MaterialStateProperty.all(
                Theme.of(context).colorScheme.primary)),
      ),
    );
  }
}
