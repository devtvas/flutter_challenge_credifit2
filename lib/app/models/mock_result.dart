import 'package:test/app/models/bank_model.dart';
import 'package:test/app/models/mock_model.dart';

class MockResult {
  const MockResult({required this.items});

  // final List<BankModel> items;
  final List<MockModel> items;

  static MockResult fromJson(Map<String, dynamic> json) {
    final items = (json['items'] as List<dynamic>)
        .map((dynamic item) => MockModel.fromJson(item as Map<String, dynamic>))
        .toList();
    return MockResult(items: items);
  }
}
