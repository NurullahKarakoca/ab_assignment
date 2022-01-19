import 'package:ab_assignment/pages/pre_login_page.dart';
import 'package:ab_assignment/utils/color.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alternatif Bank Assignment',
      theme: ThemeData(colorScheme: ColorScheme.light(primary: primaryColor)),
      debugShowCheckedModeBanner: false,
      home: const PreLoginPage(),
    );
  }
}
