import 'package:ab_assignment/models/bank_account.dart';
import 'package:ab_assignment/network/network_state.dart';
import 'package:dio/dio.dart';

import '../locator.dart';

class BankAccountRepository {
  final _dio = locator<Dio>();

  Future<NetworkState> getBankAccounts() async {
    NetworkState state;

    try {
      var response = await _dio.get(
        "bank_accounts",
      );
      var json = response.data;
      var bankAccountList = List.generate(
          json.length, (index) => BankAccount.fromJson(json[index]));
      state = NetworkState.loaded;
      state.data = bankAccountList;
    } on DioError catch (e) {
      state = NetworkState.failed(e.error);
    }

    return state;
  }
}
