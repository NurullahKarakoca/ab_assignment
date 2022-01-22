import 'package:ab_assignment/utils/string.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _MainAppBarTitle(index: _currentIndex),
      ),
      body: _MainBody(
        index: _currentIndex,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: home),
          BottomNavigationBarItem(
              icon: Icon(Icons.compare_arrows_outlined), label: moneyTransfer),
          BottomNavigationBarItem(
              icon: Icon(Icons.payment_outlined), label: payments),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outlined), label: profile)
        ],
      ),
    );
  }
}

class _MainBody extends StatelessWidget {
  final int index;

  const _MainBody({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: index,
      children: const [
        Center(
          child: Text(home),
        ),
        Center(
          child: Text(moneyTransfer),
        ),
        Center(
          child: Text(payments),
        ),
        Center(
          child: Text(profile),
        ),
      ],
    );
  }
}

class _MainAppBarTitle extends StatelessWidget {
  final int index;

  const _MainAppBarTitle({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: index,
      children: const [
        Center(
          child: Text(home),
        ),
        Center(
          child: Text(moneyTransfer),
        ),
        Center(
          child: Text(payments),
        ),
        Center(
          child: Text(profile),
        ),
      ],
    );
  }
}
