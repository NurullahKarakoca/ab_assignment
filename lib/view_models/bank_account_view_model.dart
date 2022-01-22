import 'package:ab_assignment/locator.dart';
import 'package:ab_assignment/network/network_state.dart';
import 'package:ab_assignment/repositories/bank_account_repository.dart';
import 'package:flutter/material.dart';

class BankAccountViewModel extends ChangeNotifier {
  final _bankAccountRepository = locator<BankAccountRepository>();

  late NetworkState _bankAccountsState;

  NetworkState get bankAccountsState => _bankAccountsState;

  set bankAccountsState(NetworkState bankAccountsState) {
    _bankAccountsState = bankAccountsState;
    notifyListeners();
  }

  BankAccountViewModel() {
    getBankAccounts();
  }

  Future<void> getBankAccounts() async {
    _bankAccountsState = NetworkState.loading;
    bankAccountsState = await _bankAccountRepository.getBankAccounts();
  }
}
