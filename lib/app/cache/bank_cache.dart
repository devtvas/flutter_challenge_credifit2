import 'package:test/app/models/bank_result.dart';

class BankCache {
  final _cache = <String, BankResult>{};

  BankResult? getAll() => _cache[{}];

  BankResult? get(String term) => _cache[term];

  void set(String term, BankResult result) => _cache[term] = result;

  bool contains(String term) => _cache.containsKey(term);

  void remove(String term) => _cache.remove(term);
}
