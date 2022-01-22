import 'package:ab_assignment/utils/dimen.dart';
import 'package:ab_assignment/utils/string.dart';
import 'package:ab_assignment/widgets/prelogin/appbar_logo.dart';
import 'package:ab_assignment/widgets/prelogin/language_text_button.dart';
import 'package:ab_assignment/widgets/prelogin/login_button.dart';
import 'package:ab_assignment/widgets/prelogin/sign_up_button.dart';
import 'package:ab_assignment/widgets/prelogin/version_number.dart';
import 'package:ab_assignment/widgets/prelogin/welcome_text.dart';
import 'package:flutter/material.dart';

class PreLoginPage extends StatefulWidget {
  const PreLoginPage({Key? key}) : super(key: key);

  @override
  _PreLoginPageState createState() => _PreLoginPageState();
}

class _PreLoginPageState extends State<PreLoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        elevation: 0,
        leading: const Center(
          child: VersionNumber(),
        ),
        title: const AppbarLogo(),
        actions: const [LanguageTextButton()],
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(paddingSize),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              WelcomeText(),
              SizedBox(
                height: paddingSize,
              ),
              LoginButton(),
              SizedBox(
                height: paddingSizeSmall,
              ),
              SignUpButton()
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.lock_outlined),
            label: alternativePassword,
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.atm_outlined), label: atmOrBranch),
          BottomNavigationBarItem(
              icon: Icon(Icons.show_chart_outlined), label: exchangeRates),
          BottomNavigationBarItem(
              icon: Icon(Icons.headset_mic_outlined), label: contact)
        ],
      ),
    );
  }
}
