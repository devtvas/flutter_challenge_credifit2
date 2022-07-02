import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:test/app/models/mock_result.dart';
import 'package:test/app/models/search_result_error.dart';

class MockAPI {
  MockAPI({http.Client? httpClient, this.baseUrl = path})
      : httpClient = httpClient ?? http.Client();

  final String baseUrl;
  final http.Client httpClient;
  static const path = 'assets/data/bank.json';

  Future<MockResult> getAll() async {
    final response = await httpClient.get(Uri.file(baseUrl, windows: false));
    final results = json.decode(response.body);

    print(results);

    if (response.statusCode == 200) {
      return MockResult.fromJson(results);
    } else {
      throw SearchResultError.fromJson(results);
    }
  }
}
