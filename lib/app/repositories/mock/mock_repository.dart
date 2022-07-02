import 'dart:async';

import 'package:test/app/api/mock_api.dart';
import 'package:test/app/models/mock_result.dart';
import 'package:test/app/cache/bank_cache.dart';
import 'package:test/app/repositories/mock/i_mock_repository.dart';

class MockRepository implements IMockRepository {
  final BankCache cache;
  final MockAPI mockAPI;

  ///[constructor]
  MockRepository(this.cache, this.mockAPI);
  @override
  Future<void> delete(int id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<MockResult> getAll() {
    //  final cachedResult =  cache.getAll();
    // if (cachedResult != null) {
    //   return cachedResult;
    // }
    final result = mockAPI.getAll();
    // cache.set(term, result);
    return result;
  }

  @override
  Future<MockResult?> getOne(int id) {
    // TODO: implement getOne
    throw UnimplementedError();
  }

  @override
  Future<void> insert(MockResult mockResult) {
    // TODO: implement insert
    throw UnimplementedError();
  }

  @override
  Future<void> update(MockResult mockResult) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
