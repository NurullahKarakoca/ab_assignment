import 'package:ab_assignment/locator.dart';
import 'package:ab_assignment/pages/pre_login_page.dart';
import 'package:ab_assignment/utils/color.dart';
import 'package:ab_assignment/utils/string.dart';
import 'package:ab_assignment/view_models/authentication_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/login_page.dart';
import 'pages/main_page.dart';
import 'utils/dimen.dart';
import 'utils/route.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      theme: ThemeData(
          primaryColor: primaryColor,
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            showUnselectedLabels: true,
            backgroundColor: primaryColor,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white.withAlpha(textColorAlpha),
            type: BottomNavigationBarType.fixed,
          ),
          inputDecorationTheme:
              const InputDecorationTheme(border: OutlineInputBorder()),
          colorScheme: const ColorScheme.light(primary: primaryColor)),
      debugShowCheckedModeBanner: false,
      initialRoute: routeRoot,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case routeRoot:
            return MaterialPageRoute(
                builder: (context) => const PreLoginPage());
          case routeLogin:
            return MaterialPageRoute(
                builder: (context) => ChangeNotifierProvider(
                      create: (context) => AuthenticationViewModel(context),
                      child: const LoginPage(),
                    ));
          case routeMain:
            return MaterialPageRoute(builder: (context) => const MainPage());
        }
      },
    );
  }
}
