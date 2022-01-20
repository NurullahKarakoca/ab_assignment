import 'package:ab_assignment/utils/string.dart';
import 'package:ab_assignment/widgets/login/corporate_login.dart';
import 'package:ab_assignment/widgets/login/retail_login.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(login),
        centerTitle: true,
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            TabBar(
                indicatorColor: Theme.of(context).colorScheme.primary,
                labelColor: Colors.black,
                tabs: const [
                  Tab(
                    text: retail,
                  ),
                  Tab(
                    text: corporate,
                  )
                ]),
            const Expanded(
                child: TabBarView(children: [RetailLogin(), CorporateLogin()])),
          ],
        ),
      ),
    );
  }
}
