import 'package:ab_assignment/utils/dimen.dart';
import 'package:ab_assignment/utils/string.dart';
import 'package:flutter/material.dart';

class VersionNumber extends StatelessWidget {
  const VersionNumber({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      versionNumber,
      style: Theme.of(context)
          .textTheme
          .caption
          ?.apply(color: Colors.white.withAlpha(preLoginAlpha)),
    );
  }
}
