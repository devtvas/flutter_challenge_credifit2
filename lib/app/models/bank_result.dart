import 'package:test/app/models/bank_model.dart';

class BankResult {
  const BankResult({required this.items});

  final List<BankModel> items;
  // final List<MockModel> items;

  static BankResult fromJson(Map<String, dynamic> json) {
    final items = (json['items'] as List<dynamic>)
        .map((dynamic item) => BankModel.fromJson(item as Map<String, dynamic>))
        .toList();
    return BankResult(items: items);
  }
}
