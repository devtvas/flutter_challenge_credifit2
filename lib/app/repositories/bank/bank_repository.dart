import 'dart:async';

import 'package:test/app/api/bank_api.dart';
import 'package:test/app/models/bank_result.dart';
import 'package:test/app/cache/bank_cache.dart';

import 'i_bank_repository.dart';

class BankRepository implements IBankRepository {
  final BankCache cache;
  final BankAPI bankAPI;

  const BankRepository(
    this.cache,
    this.bankAPI,
  );

  @override
  Future<void> delete(int id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<BankResult?> getAll() {
    // final cachedResult = cache.get(term);
    // if (cachedResult != null) {
    //   return cachedResult;
    // }
    final result = bankAPI.getByString('term');
    // cache.set(term, result);
    return result;
  }

  @override
  Future<BankResult?> getOne(int id) {
    // TODO: implement getOne
    throw UnimplementedError();
  }

  @override
  Future<void> insert(BankResult bankResult) {
    // TODO: implement insert
    throw UnimplementedError();
  }

  @override
  Future<void> update(BankResult bankResult) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
