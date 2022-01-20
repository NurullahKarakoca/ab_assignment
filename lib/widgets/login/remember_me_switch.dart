import 'package:ab_assignment/utils/dimen.dart';
import 'package:ab_assignment/utils/string.dart';
import 'package:flutter/material.dart';

class RememberMeSwitch extends StatelessWidget {
  final bool value;
  final Function(bool value) onChanged;

  const RememberMeSwitch(
      {Key? key, this.value = false, required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Switch.adaptive(
          value: value,
          onChanged: onChanged,
          activeColor: Theme.of(context).colorScheme.primary,
        ),
        const SizedBox(
          width: paddingSizeXSmall,
        ),
        InkWell(
            onTap: () {
              onChanged(!value);
            },
            child: Text(
              rememberMe,
              style: Theme.of(context)
                  .textTheme
                  .caption
                  ?.apply(color: Theme.of(context).colorScheme.primary),
            ))
      ],
    );
  }
}
