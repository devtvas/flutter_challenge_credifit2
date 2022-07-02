import 'package:test/app/models/mock_result.dart';

class BankCache {
  final _cache = <String, MockResult>{};

  MockResult? getAll() => _cache[{}];

  MockResult? get(String term) => _cache[term];

  void set(String term, MockResult result) => _cache[term] = result;

  bool contains(String term) => _cache.containsKey(term);

  void remove(String term) => _cache.remove(term);
}
