import 'dart:async';

import 'package:test/app/models/bank_result.dart';

abstract class IBankRepository {
  // common structure
  Future<BankResult?> getAll();
  Future<BankResult?> getOne(int id);
  Future<void> insert(BankResult bankResult);
  Future<void> update(BankResult bankResult);
  Future<void> delete(int id);
}
