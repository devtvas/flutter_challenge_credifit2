import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test/app/models/bank_result.dart';
import 'package:test/app/models/search_result_error.dart';

class BankAPI {
  BankAPI({http.Client? httpClient, this.baseUrl = path})
      : this.httpClient = httpClient ?? http.Client();

  final String baseUrl;
  final http.Client httpClient;
  static const path = "https://api.github.com/search/repositories?q=";

  Future<BankResult> getByString(String term) async {
    final response = await httpClient.get(Uri.parse("$baseUrl$term"));
    final results = json.decode(response.body);

    print(results);

    if (response.statusCode == 200) {
      return BankResult.fromJson(results);
    } else {
      throw SearchResultError.fromJson(results);
    }
  }
}
